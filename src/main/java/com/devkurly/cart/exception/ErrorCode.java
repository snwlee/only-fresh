package com.devkurly.cart.exception;

import lombok.Getter;

@Getter
public enum ErrorCode {
    PRODUCT_OUT_OF_STOCK(400, "POOS1", "제품이 품절 되었습니다.");


    private final int status;
    private final String code;
    private final String message;

    ErrorCode(int status, String code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }
}
