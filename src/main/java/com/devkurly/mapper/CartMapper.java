package com.devkurly.mapper;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {

    Integer insert(Cart cart);
    Cart findByCart(Cart cart);
    List<Cart> findAllByUserId(String user_id);
    Integer update(Cart cart);
    Integer delete(String user_id);
    Integer deleteOne(Cart cart);
    List<CartProductResponseDto> joinCartProductByUserId(String user_id);
    CartProductResponseDto joinCartProductByCart(Cart cart);


}
