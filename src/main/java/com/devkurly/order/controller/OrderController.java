package com.devkurly.order.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.service.CartService;
import com.devkurly.member.dto.MemberMainResponseDto;
import com.devkurly.order.domain.OrderProduct;
import com.devkurly.order.dto.OrderResponseDto;
import com.devkurly.order.dto.OrderUpdateRequestDto;
import com.devkurly.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;

    @GetMapping("")
    public String requestOrder(Model model, HttpSession session) {
        Integer user_id = ((MemberMainResponseDto) session.getAttribute("memberResponse")).getUser_id();
        // 유저 기반 주문 생성
        orderService.addOrder(user_id);

        // 생성한 주문 내역 ID 로 주문 - 제품 생성해야한다.
        // 장바구니 기반 생성
        Integer order_id = orderService.checkRecentOrderId(user_id);
        List<Cart> cartList = cartService.viewAllCart(user_id);
        for (Cart cart : cartList) {
            orderService.insertOrderProduct(new OrderProduct(order_id, cart.getPdt_id(), cart.getPdt_qty()));
        }

        // 생성한 주문 기반으로 주문서 출력
        List<OrderResponseDto> orderResponseDto = orderService.viewOrderProduct(order_id);
        List<CartProductResponseDto> viewCartProduct = cartService.viewCartProduct(user_id);
        int sum = 0;
        for (CartProductResponseDto responseDto : viewCartProduct) {
            sum += responseDto.getSel_price() * responseDto.getPdt_qty();
        }
        DecimalFormat df = new DecimalFormat("###,###");
        model.addAttribute("sum", df.format(sum));
        model.addAttribute("order_id", order_id);
        model.addAttribute("cart", viewCartProduct);
        model.addAttribute("order", orderResponseDto);
        return "order/order";
    }



    @GetMapping("/1/{ord_id}")
    public String viewOrder(@PathVariable Integer ord_id) {

        return "/order/order";
    }

    @PostMapping("/3")
    public String modifyOrder(OrderUpdateRequestDto requestDto) {
        orderService.modifyOrder(requestDto.toEntity());
        return "redirect:/orders";
    }

    @PostMapping("/4/{ord_id}")
    public String deleteOrder(@PathVariable Integer ord_id, HttpSession session) {
        orderService.removeOrder((Integer) session.getAttribute("memberResponse"), ord_id);
        return "redirect:/orders";
    }
}
