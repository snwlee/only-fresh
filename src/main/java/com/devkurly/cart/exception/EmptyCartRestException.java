package com.devkurly.cart.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class EmptyCartRestException extends RuntimeException{

    private final ErrorCode errorCode;

    public EmptyCartRestException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
