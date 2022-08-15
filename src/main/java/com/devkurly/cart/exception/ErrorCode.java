package com.devkurly.cart.exception;

import lombok.Getter;

@Getter
public enum ErrorCode {

    EMPTY_CART_PRODUCT(200, "ECP1", "장바구니가 비어 있습니다."),
    DUPLICATE_CART_PRODUCT(200, "DCP1", "이미 장바구니에 제품이 있습니다."),
    OUT_OF_STOCK(200, "OOS1", "제품 재고가 부족합니다.");

    private final int status;
    private final String code;
    private final String message;

    ErrorCode(int status, String code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }
}
