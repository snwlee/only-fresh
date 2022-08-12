package com.devkurly.order.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.service.CartService;
import com.devkurly.order.dto.OrderSaveRequestDto;
import com.devkurly.order.dto.OrderUpdateRequestDto;
import com.devkurly.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;
    private final CartService cartService;

    @PostMapping("")
    public String requestOrder(HttpSession session) {
        Integer user_id = (Integer) session.getAttribute("user_id");
        List<Cart> cartList = cartService.viewAllCart(user_id);
        // 유저 기반 주문 생성
        orderService.addOrder(user_id);

        // 생성한 주문 내역 ID 로 주문 - 제품 생성해야한다.
        return "redirect:/orders";
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
        orderService.removeOrder((Integer) session.getAttribute("user_id"), ord_id);
        return "redirect:/orders";
    }
}
