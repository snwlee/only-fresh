package com.devkurly.member.exception;

import com.devkurly.global.ErrorCode;
import lombok.Getter;

@Getter
public class DuplicateMemberException extends RuntimeException{
    private final ErrorCode errorCode;

    public DuplicateMemberException(String message, ErrorCode errorCode) {
        super(errorCode.getMessage() + message);
        this.errorCode = errorCode;
    }
}
