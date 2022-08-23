package com.devkurly.order.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class OrderException extends RuntimeException{
    private final ErrorCode errorCode;

    public OrderException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
