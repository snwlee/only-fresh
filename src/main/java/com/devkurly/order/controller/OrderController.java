package com.devkurly.order.controller;

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

@Controller
@RequiredArgsConstructor
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/1/{ord_id}")
    public String viewOrder(@PathVariable Integer ord_id) {
        return "/order/order";
    }

    @PostMapping("/2")
    public String requestOrder(OrderSaveRequestDto requestDto) {
        orderService.addOrder(requestDto.toEntity());
        return "redirect:/orders";
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
