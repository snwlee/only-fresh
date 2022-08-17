package com.devkurly.cart.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
public class Cart {
    @NotBlank
    private Integer user_id;
    @NotBlank
    private Integer pdt_id;
    @NotBlank
    private Integer pdt_qty;

    public void updateCart(Integer user_id, Integer pdt_id) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
    }

    @Builder
    public Cart(Integer user_id, Integer pdt_id, Integer pdt_qty) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
        this.pdt_qty = pdt_qty;
    }
}
