package com.devkurly.mapper;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.product.domain.ProductDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {

    Integer save(Cart cart);
    Cart findByCart(Cart cart);
    List<Cart> findAllByUserId(Integer user_id);
    ProductDto findProductByPdtId(Integer pdt_id);
    Integer update(Cart cart);
    Integer delete(Integer user_id);
    Integer deleteOne(Cart cart);
    List<CartProductResponseDto> joinCartProductByUserId(Integer user_id);
    CartProductResponseDto joinCartProductByCart(Cart cart);

}
