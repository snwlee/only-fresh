package com.devkurly.payment.service;

import com.devkurly.global.ErrorCode;
import com.devkurly.payment.domain.Payment;
import com.devkurly.payment.dto.PaymentResponseDto;
import com.devkurly.payment.dto.PaymentSaveRequestDto;
import com.devkurly.payment.dto.PaymentUpdateRequestDto;
import com.devkurly.mapper.PaymentMapper;
import com.devkurly.payment.exception.PaymentException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PaymentService {

    private final PaymentMapper paymentMapper;

    public PaymentResponseDto viewPayment(Integer ord_id) {
        Payment payment = Optional.ofNullable(paymentMapper.findById(ord_id)).orElseThrow(() -> new PaymentException("결제 내역이 없습니다.", ErrorCode.PAYMENT_ERROR));
        return new PaymentResponseDto(payment);
    }

    public void addPayment(PaymentSaveRequestDto requestDto) {
        Optional.ofNullable(paymentMapper.save(requestDto.toEntity()))
                .ifPresent(num -> {
                    throw new PaymentException("이미 결제 이력이 있습니다.", ErrorCode.PAYMENT_ERROR);
                });
    }

    public Integer modifyPayment(PaymentUpdateRequestDto requestDto) {
        return paymentMapper.update(requestDto.toEntity());
    }

    public Integer removePayment(Integer user_id, Integer ord_id) {
        return paymentMapper.delete(user_id, ord_id);
    }
}
