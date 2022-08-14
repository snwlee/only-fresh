package com.devkurly.cart.exception;

import lombok.Getter;

@Getter
public enum ErrorCode {
    DUPLICATE_CART_PRODUCT(200, "DCP1", "이미 장바구니에 제품이 있습니다.");

    private final int status;
    private final String code;
    private final String message;

    ErrorCode(int status, String code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }
}
