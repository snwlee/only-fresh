package com.devkurly.order.service;

import com.devkurly.order.domain.Order;
import com.devkurly.order.domain.OrderProduct;
import com.devkurly.order.dto.OrderResponseDto;
import com.devkurly.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderMapper orderMapper;

    public Integer checkRecentOrderId(Integer user_id) {
        return orderMapper.findById(user_id);
    }
    public Integer insertOrderProduct(OrderProduct orderProduct) {
        return orderMapper.insertOrderProduct(orderProduct);
    }

    public List<OrderResponseDto> viewOrderProduct(Integer order_id) {
        return orderMapper.joinOrderProduct(order_id);
    }
    public Integer addOrder(Integer user_id) {
        return orderMapper.save(user_id);
    }

    public Integer modifyOrder(Order order) {
        return orderMapper.update(order);
    }

    public Integer removeOrder(Integer user_id, Integer ord_id) {
        return orderMapper.delete(user_id, ord_id);
    }
}
