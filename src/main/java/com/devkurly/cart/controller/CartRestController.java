package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartRestController {

    private final CartService cartService;

    @GetMapping("/rest/view")
    public ResponseEntity<List<CartProductResponseDto>> viewCart(@CookieValue(value="tempCart", required = false) Cookie tempCart, HttpServletResponse response, HttpSession session) {
        List<CartProductResponseDto> cartList;
        Integer user_id = (Integer) session.getAttribute("user_id");
        if (Optional.ofNullable(user_id).isPresent()) {
            cartList = cartService.viewCartProduct(user_id);
        } else {
            cartList = cartService.viewCartProduct(cartService.getCookieId(tempCart, response));
        }
        return new ResponseEntity<>(cartList, HttpStatus.OK);
    }

    @PostMapping("/qty")
    public Cart modifyCartQty(@RequestBody Cart cart) {
        cartService.checkProductStock(cart);
        cartService.modifyCart(cart);
        return cart;
    }
}
