package com.devkurly.order.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class AddressException extends RuntimeException{
    private final ErrorCode errorCode;

    public AddressException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
