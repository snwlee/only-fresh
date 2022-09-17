package com.devkurly.cart.domain;

import lombok.*;

import javax.validation.constraints.NotBlank;

@Data
@Builder
public class Cart {
    private Integer user_id;
    private Integer pdt_id;
    private Integer pdt_qty;
}
