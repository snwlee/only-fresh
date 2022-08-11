package com.devkurly.payment.service;

import com.devkurly.payment.dto.PaymentResponseDto;
import com.devkurly.payment.dto.PaymentSaveRequestDto;
import com.devkurly.payment.dto.PaymentUpdateRequestDto;
import com.devkurly.mapper.PaymentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PaymentService {

    private final PaymentMapper paymentMapper;

    public PaymentResponseDto viewPayment(Integer ord_id) {
        return new PaymentResponseDto(paymentMapper.findById(ord_id));
    }

    public Integer addPayment(PaymentSaveRequestDto requestDto) {
        return paymentMapper.insert(requestDto.toEntity());
    }

    public Integer modifyPayment(PaymentUpdateRequestDto requestDto) {
        return paymentMapper.update(requestDto.toEntity());
    }

    public Integer removePayment(Integer user_id, Integer ord_id) {
        return paymentMapper.delete(user_id, ord_id);
    }
}
