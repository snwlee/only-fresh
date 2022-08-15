package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartRestController {

    private final CartService cartService;

    @GetMapping("/rest/view")
    public ResponseEntity<List<CartResponseDto>> viewCart(HttpSession session) {
        List<CartResponseDto> cartList = cartService.viewCartProduct((Integer) session.getAttribute("user_id"));
//        int sum = 0;
//        for (CartResponseDto responseDto : cartList) {
//            sum += responseDto.getSel_price() * responseDto.getPdt_qty();
//        }
//        model.addAttribute("sum", sum);
//        model.addAttribute("cart", cartList);
        return new ResponseEntity<>(cartList, HttpStatus.OK);
    }
}
