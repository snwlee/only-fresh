package com.devkurly.payment.mapper;

import com.devkurly.order.domain.Order;
import com.devkurly.order.dto.OrderResponseDto;
import com.devkurly.payment.domain.Payment;
import com.devkurly.payment.dto.PaymentResponseDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PaymentMapper {

    Integer insert(Payment payment);
    Payment findById(Integer ord_id);

    Integer update(Payment payment);

    Integer delete(@Param("user_id") Integer user_id, @Param("ord_id") Integer ord_id);

}
