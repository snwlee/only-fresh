package com.devkurly.global;

import com.devkurly.cart.exception.DuplicateCartException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(DuplicateCartException.class)
    @ResponseStatus(HttpStatus.OK)
    public String catcher(HttpServletResponse response, Exception e) throws IOException {
        System.out.println("이미 장바구니에 제품이 있습니다.");
        response.sendRedirect("/members?error=1");
        return "/member/signIn";
    }
}
