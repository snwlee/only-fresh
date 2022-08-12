package com.devkurly.order.service;

import com.devkurly.order.domain.Order;
import com.devkurly.order.dto.OrderResponseDto;
import com.devkurly.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderMapper orderMapper;

    public OrderResponseDto viewOrder(Integer ord_id) {
        return orderMapper.findById(ord_id);
    }

    public Integer addOrder(Order order) {
        return orderMapper.insert(order);
    }

    public Integer modifyOrder(Order order) {
        return orderMapper.update(order);
    }

    public Integer removeOrder(Integer user_id, Integer ord_id) {
        return orderMapper.delete(user_id, ord_id);
    }
}
