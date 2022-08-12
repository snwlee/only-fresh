package com.devkurly.cart.service;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.dto.CartUpdateRequestDto;
import com.devkurly.mapper.CartMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartMapper cartMapper;

    public List<Cart> viewCart(Integer user_id) {
        return cartMapper.findById(user_id);
    }

    public Integer addCart(CartSaveRequestDto requestDto) {
        // pdt_id == null
        return cartMapper.insert(requestDto.toEntity());
        // pdt_id != null
        // return cartMapper.update(requestDto.toEntity());
    }

    public Integer modifyCart(CartSaveRequestDto requestDto) {
        return cartMapper.update(requestDto.toEntity());
    }

    public Integer removeCart(Integer user_id, Integer pdt_id) {
        return cartMapper.delete(user_id, pdt_id);
    }
}
