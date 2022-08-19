package com.devkurly.cart.dto;

import com.devkurly.cart.domain.Cart;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
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

    @Builder
    public CartProductResponseDto(Integer user_id, Integer pdt_id, Integer pdt_qty, Integer price, String image, Integer ds_rate, Integer sel_price, String title, Integer stock, String company) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
        this.pdt_qty = pdt_qty;
        this.price = price;
        this.image = image;
        this.ds_rate = ds_rate;
        this.sel_price = sel_price;
        this.title = title;
        this.stock = stock;
        this.company = company;
    }

    public Cart toEntity() {
        return Cart.builder()
                .user_id(user_id)
                .pdt_id(pdt_id)
                .pdt_qty(pdt_qty)
                .build();
    }
}
