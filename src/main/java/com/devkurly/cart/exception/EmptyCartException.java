package com.devkurly.cart.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class EmptyCartException extends RuntimeException{
    private final ErrorCode errorCode;

    public EmptyCartException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
