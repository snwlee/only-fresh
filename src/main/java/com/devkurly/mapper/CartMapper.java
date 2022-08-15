package com.devkurly.mapper;

import com.devkurly.cart.domain.Cart;
<<<<<<< HEAD
import com.devkurly.cart.dto.CartResponseDto;
=======
import com.devkurly.cart.dto.CartProductResponseDto;
>>>>>>> upstream/main
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {

    Integer insert(Cart cart);
    Cart findByCart(Cart cart);
    List<Cart> findAllByUserId(Integer user_id);
    Integer update(Cart cart);
    Integer delete(Integer user_id);
    Integer deleteOne(@Param("user_id") Integer user_id, @Param("pdt_id") Integer pdt_id);
    List<CartProductResponseDto> joinCartProductByUserId(Integer user_id);
    CartProductResponseDto joinCartProductByCart(Cart cart);


}
