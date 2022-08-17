package com.devkurly.mapper;

import com.devkurly.order.domain.Order;
import com.devkurly.order.domain.OrderProduct;
import com.devkurly.order.dto.OrderResponseDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderMapper {

    Integer save(Integer user_id);
    Integer findById(Integer user_id);
    Integer insertOrderProduct(OrderProduct orderProduct);
    List<OrderResponseDto> joinOrderProduct(Integer order_id);
    Integer update(Order order);
    Integer delete(@Param("user_id") Integer user_id, @Param("ord_id") Integer ord_id);

}
