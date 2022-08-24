package com.devkurly.cart.dto;

import com.devkurly.cart.domain.Cart;
import lombok.*;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
public class CartSaveRequestDto {
    private Integer user_id;
    private Integer pdt_id;
    private Integer pdt_qty;

    public CartSaveRequestDto(Cart cart) {
        this.user_id = cart.getUser_id();
        this.pdt_id = cart.getPdt_id();
        this.pdt_qty = cart.getPdt_qty();
    }

    public void saveCart(Integer user_id, Integer pdt_id) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
    }

    public void saveCart(Integer user_id, Integer pdt_id, Integer pdt_qty) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
        this.pdt_qty = pdt_qty;
    }

    public CartSaveRequestDto(Integer user_id, Integer pdt_id) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
    }

    @Builder
    public CartSaveRequestDto(Integer user_id, Integer pdt_id, Integer pdt_qty) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
        this.pdt_qty = pdt_qty;
    }

    public Cart toEntity() {
        return Cart.builder()
                .user_id(user_id)
                .pdt_id(pdt_id)
                .pdt_qty(pdt_qty)
                .build();
    }
}
