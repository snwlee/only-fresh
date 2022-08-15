package com.devkurly.cart.service;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.exception.EmptyCartException;
import com.devkurly.cart.exception.ErrorCode;
import com.devkurly.cart.exception.OutOfStockException;
import com.devkurly.mapper.CartMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartMapper cartMapper;

    /**
     * temp
     */
    @Transactional
    public Cart viewCart(Cart cart) {
        return cartMapper.findByCart(cart);
    }

    /**
     * temp
     */
    @Transactional
    public List<Cart> viewAllCart(String user_id) {
        return cartMapper.findAllByUserId(user_id);
    }

    @Transactional
    public List<CartProductResponseDto> viewCartProduct(String user_id) {
        return Optional.ofNullable(cartMapper.joinCartProductByUserId(user_id)).orElseThrow(() -> new EmptyCartException("장바구니가 비어 있습니다.", ErrorCode.EMPTY_CART_PRODUCT));
    }

    @Transactional
    public CartProductResponseDto checkCartProductStock(Cart cart) {
        CartProductResponseDto cartProductResponseDto = Optional.ofNullable(cartMapper.joinCartProductByCart(cart)).orElseThrow(() -> new EmptyCartException("장바구니가 비어 있습니다.", ErrorCode.EMPTY_CART_PRODUCT));
        Integer stock = cartProductResponseDto.getStock();
        if (cart.getPdt_qty() > stock) {
            throw new OutOfStockException("제품 재고가 부족합니다.", ErrorCode.OUT_OF_STOCK);
        }
        return cartProductResponseDto;
    }

    /**
     * temp
     */
    @Transactional
    public Integer addCart(CartSaveRequestDto requestDto) {
        return cartMapper.insert(requestDto.toEntity());
    }

    @Transactional
    public Integer modifyCart(Cart cart) {
        return cartMapper.update(cart);
    }

    @Transactional
    public Integer removeOneCart(Cart cart) {
        return cartMapper.deleteOne(cart);
    }

    @Transactional
    public void removeCheckedCart(List<Cart> cartList) {
        for (Cart cart : cartList) {
            cartMapper.deleteOne(cart);
        }
    }

    @Transactional
    public Integer removeCart(String user_id) {
        return cartMapper.delete(user_id);
    }


}
