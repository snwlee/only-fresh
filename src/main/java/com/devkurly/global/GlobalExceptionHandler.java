package com.devkurly.global;

import com.devkurly.cart.exception.EmptyCartException;
import com.devkurly.cart.exception.OutOfStockException;
import com.devkurly.member.exception.DuplicateMemberException;
import com.devkurly.member.exception.SignInException;
import com.devkurly.member.exception.SignUpException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import java.io.IOException;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(EmptyCartException.class)
    @ResponseStatus(HttpStatus.OK)
    public ResponseEntity<String> cartCatcher(HttpServletResponse response, Exception e) throws IOException {
        System.out.println("장바구니가 비어 있습니다.");
        response.sendRedirect("/carts?error=1");
        return ResponseEntity.ok().body(ErrorCode.EMPTY_CART_PRODUCT.getMessage());
    }

    @ExceptionHandler(OutOfStockException.class)
    public ResponseEntity<String> productCatcher(Exception e){
        System.out.println("제품 재고가 부족합니다.");
        return ResponseEntity.badRequest().body(ErrorCode.OUT_OF_STOCK.getMessage());
    }

    @ExceptionHandler(SignInException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<String> signInCatcher(HttpServletResponse response, HttpServletRequest request, Exception e) throws IOException {
        System.out.println("로그인에 실패했습니다.");
        response.sendRedirect("/members?error=1&toURL="+ request.getRequestURL());
        return ResponseEntity.badRequest().body(ErrorCode.SIGN_IN_FAIL.getMessage());
    }

    @ExceptionHandler(DuplicateMemberException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public ResponseEntity<String> duplicateCatcher(HttpServletResponse response, Exception e) throws IOException {
        System.out.println("회원가입에 실패했습니다.");
        response.sendRedirect("/members/signup?error=1");
        return ResponseEntity.badRequest().body(ErrorCode.SIGN_UP_FAIL.getMessage());
    }

    @ExceptionHandler(ConstraintViolationException.class)
    protected ResponseEntity<String> validCatcher(HttpServletResponse response, Exception e) throws IOException {
        System.out.println("잘못된 값이 입력 되었습니다.");
        response.sendRedirect("/members/signup?error=2");
        return ResponseEntity.badRequest().body(ErrorCode.SIGN_UP_FAIL.getMessage());
    }

    @ExceptionHandler(SignUpException.class)
    protected ResponseEntity<String> signUpCatcher(HttpServletResponse response, Exception e) throws IOException {
        System.out.println("잘못된 값이 입력 되었습니다.");
        response.sendRedirect("/members/signup?error=3");
        return ResponseEntity.badRequest().body(ErrorCode.SIGN_UP_FAIL.getMessage());
    }
}
