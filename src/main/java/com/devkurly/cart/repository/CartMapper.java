package com.devkurly.cart.repository;

import com.devkurly.cart.domain.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CartMapper {

    int insert(Cart cart);

    Cart findById(Integer user_id);

    int update(Cart cart);

    int delete(@Param("user_id") Integer user_id, @Param("pdt_id") Integer pdt_id);

}
