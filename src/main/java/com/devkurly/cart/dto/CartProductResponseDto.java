package com.devkurly.cart.dto;

import com.devkurly.cart.domain.Cart;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class CartProductResponseDto {

    private Integer user_id;

    private Integer pdt_id;

    private Integer pdt_qty;

    private Integer price;

    private String image;

    private Integer ds_rate;

    private Integer sel_price;

    private String title;

    private Integer stock;

    private String company;

    public CartProductResponseDto(Cart cart) {
        this.user_id = cart.getUser_id();
        this.pdt_id = cart.getPdt_id();
        this.pdt_qty = cart.getPdt_qty();
    }

    public Cart toEntity() {
        return Cart.builder()
                .user_id(user_id)
                .pdt_id(pdt_id)
                .pdt_qty(pdt_qty)
                .build();
    }
}
