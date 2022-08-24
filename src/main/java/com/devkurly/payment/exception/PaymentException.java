package com.devkurly.payment.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class PaymentException extends RuntimeException{
    private final ErrorCode errorCode;

    public PaymentException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
