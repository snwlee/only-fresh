package com.devkurly.payment.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.service.CartService;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.global.ErrorCode;
import com.devkurly.member.domain.Member;
import com.devkurly.member.service.MemberService;
import com.devkurly.order.dto.OrderResponseDto;
import com.devkurly.order.dto.OrderSaveRequestDto;
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

import java.util.List;

import static com.devkurly.member.controller.MemberController.getMemberResponse;

@Controller
@RequiredArgsConstructor
@RequestMapping("/payments")
public class PaymentController {

    private final PaymentService paymentService;
    private final OrderService orderService;
    private final CartService cartService;
    private final MemberService memberService;

    @PostMapping("/{ord_id}")
    public String requestPayment(@PathVariable Integer ord_id, OrderSaveRequestDto orderSaveRequestDto, PaymentSaveRequestDto paymentSaveRequestDto, HttpSession session) {
        Integer user_id = getMemberResponse(session);
        Integer used_acamt = orderSaveRequestDto.getUsed_acamt();
        Member memberById = memberService.findMemberById(user_id);
        Integer all_dc_amt;
        if (orderSaveRequestDto.getCoupn_id() != 0) {
            CouponDto couponByCouponId = memberService.findCouponByCouponId(orderSaveRequestDto.getCoupn_id());
            all_dc_amt = used_acamt + couponByCouponId.getRate();
        } else {
            all_dc_amt = used_acamt;
        }
        if (memberById.getPnt() < used_acamt) {
            throw new PaymentException("보유한 포인트보다 많은 포인트가 사용됬습니다.", ErrorCode.PAYMENT_ERROR);
        }
        if ((orderService.checkOrder(ord_id).getAll_amt() - all_dc_amt) != paymentSaveRequestDto.getAll_amt()) {
            throw new PaymentException("주문 가격과 결제 가격이 일치하지 않습니다.", ErrorCode.PAYMENT_ERROR);
        }
        orderSaveRequestDto.saveOrder(ord_id, user_id);
        paymentSaveRequestDto.savePayment(ord_id, user_id, all_dc_amt);
        orderService.updateOrder(orderSaveRequestDto);
        paymentService.addPayment(paymentSaveRequestDto);
        memberService.updateMemberPnt(user_id, (memberById.getPnt() - used_acamt), orderSaveRequestDto.getCoupn_id());
        List<OrderResponseDto> orderResponseDto = orderService.viewOrderProduct(ord_id);
        for (OrderResponseDto responseDto : orderResponseDto) {
            Cart cart = new Cart();
            cart.updateCart(user_id, responseDto.getPdt_id());
            cartService.removeOneCart(cart);
        }
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
