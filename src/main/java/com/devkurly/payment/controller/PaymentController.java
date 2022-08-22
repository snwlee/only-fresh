package com.devkurly.payment.controller;

import com.devkurly.global.ErrorCode;
import com.devkurly.order.service.OrderService;
import com.devkurly.payment.dto.PaymentResponseDto;
import com.devkurly.payment.dto.PaymentSaveRequestDto;
import com.devkurly.payment.exception.PaymentException;
import com.devkurly.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import java.util.Optional;

import static com.devkurly.member.controller.MemberController.getMemberResponse;

@Controller
@RequiredArgsConstructor
@RequestMapping("/payments")
public class PaymentController {

    private final PaymentService paymentService;
    private final OrderService orderService;

    @PostMapping("/{ord_id}")
    public String requestPayment(@PathVariable Integer ord_id, PaymentSaveRequestDto requestDto, HttpSession session) {
        Integer user_id = getMemberResponse(session);
        requestDto.savePayment(user_id, ord_id);
        if (!orderService.checkOrder(ord_id).getAll_amt().equals(requestDto.getAll_amt())) {
            throw new PaymentException("주문 가격과 결제 가격이 일치하지 않습니다.", ErrorCode.PAYMENT_ERROR);
        }
        paymentService.addPayment(requestDto);
        return "redirect:/payments/" + ord_id;
    }

    @GetMapping("/{ord_id}")
    public String viewPayment(@PathVariable Integer ord_id, Model model) {
        PaymentResponseDto paymentResponse = paymentService.viewPayment(ord_id);
        model.addAttribute("paymentResponse", paymentResponse);
        return "/payment/payment";
    }

    @GetMapping("/2")
    public String deletePayment(Integer ord_id, HttpSession session) {
        paymentService.removePayment(getMemberResponse(session), ord_id);
        return "redirect:/payments";
    }
}
