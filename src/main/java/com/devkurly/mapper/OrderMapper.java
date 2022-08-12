package com.devkurly.mapper;

import com.devkurly.order.domain.Order;
import com.devkurly.order.dto.OrderResponseDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface OrderMapper {

    Integer insert(Order order);
    OrderResponseDto findById(Integer ord_id);
    Integer update(Order order);
    Integer delete(@Param("user_id") Integer user_id, @Param("ord_id") Integer ord_id);

}
