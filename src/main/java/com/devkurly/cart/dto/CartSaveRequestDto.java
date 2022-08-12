package com.devkurly.cart.dto;

import java.util.Calendar;

public class CartSaveRequestDto {
    private Integer user_id;
    private Integer pdt_id;
    private Integer pdt_qty;
    private Calendar in_date;
    private String in_user;
    private Calendar up_date;
    private String up_user;
}
