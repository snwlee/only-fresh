package com.devkurly.cart.dto;

import com.devkurly.cart.domain.Cart;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
@NoArgsConstructor
public class CartSaveRequestDto {
    @NotBlank
    private Integer user_id;
    @NotBlank
    private Integer pdt_id;
    @NotBlank
    private Integer pdt_qty;

    public void saveCart(Integer user_id, Integer pdt_id, Integer pdt_qty) {
        this.user_id = user_id;
        this.pdt_id = pdt_id;
        this.pdt_qty = pdt_qty;
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
