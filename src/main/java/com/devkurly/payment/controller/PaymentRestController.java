package com.devkurly.payment.controller;

import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.service.CartService;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.order.domain.Order;
import com.devkurly.order.dto.OrderProductNameResponseDto;
import com.devkurly.order.dto.OrderResponseDto;
import com.devkurly.order.service.OrderService;
import com.devkurly.payment.dto.PaymentResponseDto;
import com.devkurly.payment.service.PaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

import static com.devkurly.member.controller.MemberController.getMemberResponse;

@RestController
@RequiredArgsConstructor
@RequestMapping("/payments")
public class PaymentRestController {

    private final CartService cartService;
    private final OrderService orderService;
    private final PaymentService paymentService;

    @GetMapping("/method")
    public PaymentResponseDto readPayment(HttpSession session) {
        Integer ord_id = getOrdId(session);
        return paymentService.viewPayment(ord_id);
    }

    @GetMapping("/product")
    public List<OrderProductNameResponseDto> readProduct(HttpSession session) {
        Integer ord_Id = getOrdId(session);
        List<OrderProductNameResponseDto> orderProduct = orderService.checkOrderProduct(ord_Id);
        for (OrderProductNameResponseDto orderProductNameResponseDto : orderProduct) {
            System.out.println("orderProductNameResponseDto.getTitle() = " + orderProductNameResponseDto.getTitle());
            System.out.println("orderProductNameResponseDto.getSel_price() = " + orderProductNameResponseDto.getSel_price());
        }
        return orderProduct;
    }


    private Integer getOrdId(HttpSession session) {
        Integer user_id = getMemberResponse(session);
        return orderService.checkRecentOrderId(user_id);
    }
}
