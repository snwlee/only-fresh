package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartRestController {

    private final CartService cartService;

    @GetMapping("/rest/view")
    public ResponseEntity<List<CartProductResponseDto>> viewCart(HttpSession session) {
        List<CartProductResponseDto> cartList = cartService.viewCartProduct((Integer) session.getAttribute("user_id"));
        return new ResponseEntity<>(cartList, HttpStatus.OK);
    }

    @PostMapping("/qty")
    public Cart modifyCartQty(@RequestBody Cart cart) {
        cartService.checkCartProductStock(cart);
        cartService.modifyCart(cart);
        return cart;
    }
}
