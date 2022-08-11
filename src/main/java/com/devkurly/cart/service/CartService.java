package com.devkurly.cart.service;

import com.devkurly.cart.dto.CartResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.dto.CartUpdateRequestDto;
import com.devkurly.cart.mapper.CartMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartMapper cartMapper;

    public CartResponseDto viewCart(Integer user_id) {
        return new CartResponseDto(cartMapper.findById(user_id));
    }

    public Integer addCart(CartSaveRequestDto requestDto) {
        return cartMapper.insert(requestDto.toEntity());
    }

    public Integer modifyCart(CartUpdateRequestDto requestDto) {
        return cartMapper.update(requestDto.toEntity());
    }

    public Integer removeCart(Integer user_id, Integer pdt_id) {
        return cartMapper.delete(user_id, pdt_id);
    }
}
