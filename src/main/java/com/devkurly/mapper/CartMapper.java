package com.devkurly.mapper;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartResponseDto;
import com.devkurly.product.dto.ProductDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {

    Integer insert(Cart cart);
    Cart findById(Cart cart);
    Integer update(Cart cart);
    Integer delete(Integer user_id);
    Integer deleteOne(@Param("user_id") Integer user_id, @Param("pdt_id") Integer pdt_id);
    List<CartResponseDto> joinCartProduct(Integer user_id);
}
