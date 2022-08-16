package com.devkurly.cart.dto;

import com.devkurly.cart.domain.Cart;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CartProductResponseDto {
    private String user_id;
    private Integer pdt_id;
    private Integer pdt_qty;
    private Integer price;
    private Integer ds_rate;
    private Integer sel_price;
    private String title;
    private Integer stock;

    public CartProductResponseDto(Cart cart) {
        this.user_id = cart.getUser_id();
        this.pdt_id = cart.getPdt_id();
        this.pdt_qty = cart.getPdt_qty();
    }
}
