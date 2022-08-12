package com.devkurly.cart.dto;

import com.devkurly.cart.domain.Cart;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartResponseDto {
    private Integer user_id;
    private Integer pdt_id;
    private Integer pdt_qty;

    public CartResponseDto(Cart cart) {
        this.user_id = cart.getUser_id();
        this.pdt_id = cart.getPdt_id();
        this.pdt_qty = cart.getPdt_qty();
    }
}
