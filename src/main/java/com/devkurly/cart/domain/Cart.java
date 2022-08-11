package com.devkurly.cart.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Calendar;
@Getter
@Setter
@NoArgsConstructor
public class Cart {
    private Integer user_id;
    private Integer pdt_id;
    private Integer pdt_qty;
    private Calendar in_date;
    private String in_user;
    private Calendar up_date;
    private String up_user;
}
