package com.devkurly.global;

import com.devkurly.cart.exception.EmptyCartException;
import com.devkurly.cart.exception.OutOfStockException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(EmptyCartException.class)
    @ResponseStatus(HttpStatus.OK)
    public String cartCatcher(HttpServletResponse response, Exception e) throws IOException {
        System.out.println("장바구니가 비어 있습니다.");
        response.sendRedirect("/carts/view?error=0");
        return "/cart/cartRestApi";
    }

    @ExceptionHandler(OutOfStockException.class)
    @ResponseStatus(HttpStatus.OK)
    public String productCatcher(HttpServletResponse response, Exception e) throws IOException {
        System.out.println("제품 재고가 부족합니다.");
        response.sendRedirect("/carts/view?error=1");
        return "/cart/cartRestApi";
    }
}
