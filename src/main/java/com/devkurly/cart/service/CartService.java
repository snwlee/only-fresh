package com.devkurly.cart.service;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.mapper.CartMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartMapper cartMapper;

    public Cart viewCart(Cart cart) {
        return cartMapper.findByCart(cart);
    }

    public List<Cart> viewAllCart(Integer user_id) {
        return cartMapper.findAllById(user_id);
    }

    public List<CartResponseDto> viewCartProduct(Integer user_id) {
        return cartMapper.joinCartProduct(user_id);
    }

    public Integer addCart(CartSaveRequestDto requestDto) {
        return cartMapper.insert(requestDto.toEntity());
    }

    public Integer modifyCart(Cart cart) {
        return cartMapper.update(cart);
    }

    public Integer removeOneCart(Integer user_id, Integer pdt_id) {
        return cartMapper.deleteOne(user_id, pdt_id);
    }

    public Integer removeCart(Integer user_id) {
        return cartMapper.delete(user_id);
    }


}
