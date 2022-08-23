package com.devkurly.global;

import com.devkurly.cart.exception.DuplicateCartException;
import com.devkurly.cart.exception.EmptyCartException;
import com.devkurly.cart.exception.OutOfStockException;
import com.devkurly.member.exception.DuplicateMemberException;
import com.devkurly.member.exception.SignInException;
import com.devkurly.member.exception.SignUpException;
import com.devkurly.payment.exception.PaymentException;
import lombok.Getter;

@Getter
public enum ErrorCode {

    DUPLICATE_MEMBER_EMAIL(200, "DME1", "이미 존재하는 회원입니다.", DuplicateMemberException.class),
    SIGN_IN_FAIL(400, "SIF1", "로그인에 실패하였습니다.", SignInException.class),
    SIGN_UP_FAIL(400, "SUF1", "회원가입에 실패하였습니다.", SignUpException.class),
    EMPTY_CART_PRODUCT(200, "ECP1", "장바구니가 비어 있습니다.", EmptyCartException.class),
    DUPLICATE_CART_PRODUCT(200, "DCP1", "이미 장바구니에 제품이 있습니다.", DuplicateCartException.class),
    OUT_OF_STOCK(200, "OOS1", "제품 재고가 부족합니다.", OutOfStockException.class),
    PAYMENT_ERROR(500, "EPE1", "결제 중 오류가 발생 했습니다.", PaymentException.class);

    private final int status;
    private final String code;
    private final String message;
    private final Class<? extends RuntimeException> classType;

    ErrorCode(int status, String code, String message, Class<? extends RuntimeException> classType) {
        this.status = status;
        this.code = code;
        this.message = message;
        this.classType = classType;
    }
}
