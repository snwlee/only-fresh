package com.devkurly.payment.controller;

import com.devkurly.order.service.OrderService;
import com.devkurly.payment.dto.PaymentSaveRequestDto;
import com.devkurly.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/payments")
public class PaymentController {

    private final PaymentService paymentService;
    private final OrderService orderService;

    @PostMapping("/{ord_id}")
    public String requestPayment(PaymentSaveRequestDto requestDto, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("user_id");
        requestDto.setUser_id(userId);
        paymentService.addPayment(requestDto);
        return "/payment/payment";
    }

    @GetMapping("/1/{ord_id}")
    public String viewPayment(@PathVariable Integer ord_id) {
        paymentService.viewPayment(ord_id);
        return "/payment/payment";
    }

    @GetMapping("/2")
    public String deletePayment(Integer ord_id, HttpSession session) {
        paymentService.removePayment((Integer) session.getAttribute("user_id"), ord_id);
        return "redirect:/payments";
    }
}
