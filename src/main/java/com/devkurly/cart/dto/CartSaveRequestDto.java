package com.devkurly.cart.dto;

import com.devkurly.cart.domain.Cart;
import lombok.*;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor(access = AccessLevel.PROTECTED)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Builder
public class CartSaveRequestDto {

    @NotNull(message = "유저 아이디는 필수 값입니다.")
    private Integer user_id;

    @NotNull(message = "상품 아이디는 필수 값입니다.")
    private Integer pdt_id;

    @NotNull(message = "상품 개수는 필수 값입니다.")
    @Min(value = 1)
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

    public Cart toEntity() {
        return Cart.builder()
                .user_id(user_id)
                .pdt_id(pdt_id)
                .pdt_qty(pdt_qty)
                .build();
    }
}
