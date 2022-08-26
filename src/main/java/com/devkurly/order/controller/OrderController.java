package com.devkurly.order.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.exception.EmptyCartException;
import com.devkurly.cart.service.CartService;
import com.devkurly.global.ErrorCode;
import com.devkurly.order.domain.OrderProduct;
import com.devkurly.order.dto.OrderResponseDto;
import com.devkurly.order.dto.OrderUpdateRequestDto;
import com.devkurly.order.exception.OrderException;
import com.devkurly.order.service.OrderService;
import com.devkurly.product.domain.ProductDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.devkurly.member.controller.MemberController.getMemberResponse;

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;

    @GetMapping("")
    public String requestOrder(@RequestParam(value = "checked") List<String> chArr, Model model, HttpSession session) {
        // 주문 하려는 상품이 장바구니에 있는지 확인

        Integer user_id = getMemberResponse(session);

        // 유저 기반 주문 빈 테이블 생성
        orderService.addOrder(user_id);

        // 생성한 주문 테이블의 주문 번호
        Integer order_id = orderService.checkRecentOrderId(user_id);

        // 선택한 장바구니만 주문 & 상품 테이블에 추가
        int pdt_id;
        List<CartProductResponseDto> checkedCartProduct = new ArrayList<>();
        for (String str : chArr) {
            pdt_id = Integer.parseInt(str);
            List<Cart> carts;
            try {
                carts = cartService.viewCheckedCart(new CartSaveRequestDto(user_id, pdt_id));
            } catch (EmptyCartException e) {
                orderService.removeOrder(user_id, order_id);
                throw new OrderException("주문하려는 제품이 장바구니에 없습니다.", ErrorCode.ORDER_ERROR);
            }
            for (Cart cart : carts) {
                orderService.insertOrderProduct(new OrderProduct(order_id, cart.getPdt_id(), cart.getPdt_qty()));
                List<CartProductResponseDto> viewCartProduct = cartService.viewCheckedCartProduct(new CartSaveRequestDto(cart));
                checkedCartProduct.addAll(viewCartProduct);
            }
        }

        // 생성한 주문 기반으로 주문서 출력
        List<OrderResponseDto> orderResponseDto = orderService.viewOrderProduct(order_id);
        int pdtSum = 0;
        for (CartProductResponseDto responseDto : checkedCartProduct) {
            if (responseDto.getPdt_qty() < 0) {
                throw new OrderException("제품 수량이 올바르지 않습니다.", ErrorCode.ORDER_ERROR);
            } else if (!responseDto.getPrice().equals(orderService.checkProduct(responseDto.getPdt_id()).getPrice())) {
                throw new OrderException("제품 가격이 올바르지 않습니다.", ErrorCode.ORDER_ERROR);
            }
            ProductDto productDto = orderService.checkProduct(responseDto.getPdt_id());
            pdtSum += productDto.getPrice() * responseDto.getPdt_qty();
        }
        System.out.println("pdtSum = " + pdtSum);
        int sum = 0;
        for (CartProductResponseDto responseDto : checkedCartProduct) {
            sum += responseDto.getSel_price() * responseDto.getPdt_qty();
        }
        System.out.println("sum = " + sum);
        orderService.modifyOrder(new OrderUpdateRequestDto(order_id, sum));
        model.addAttribute("sum", sum);
        model.addAttribute("pdtSum", pdtSum);
        model.addAttribute("order_id", order_id);
        model.addAttribute("cart", checkedCartProduct);
        model.addAttribute("order", orderResponseDto);
        return "/order/order";
    }
}
