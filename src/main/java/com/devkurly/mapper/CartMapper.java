package com.devkurly.mapper;

import com.devkurly.cart.domain.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CartMapper {

    Integer insert(Cart cart);

    Cart findById(Integer user_id);

    Integer update(Cart cart);

    Integer delete(@Param("user_id") Integer user_id, @Param("pdt_id") Integer pdt_id);

}
