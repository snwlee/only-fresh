package com.devkurly.cart.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class MaxCartException extends RuntimeException{

    private final ErrorCode errorCode;

    public MaxCartException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
