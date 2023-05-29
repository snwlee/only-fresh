package com.devkurly.cart.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class DuplicateCartException extends RuntimeException{

    private final ErrorCode errorCode;

    public DuplicateCartException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
