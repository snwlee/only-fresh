package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.cart.service.CartService;
import com.devkurly.member.dto.MemberMainResponseDto;
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

    @GetMapping("/view")
    public ResponseEntity<List<CartProductResponseDto>> viewCart(@CookieValue(value = "tempCart", required = false) Cookie tempCart, HttpServletResponse response, HttpSession session) {
        int id = getId(tempCart, response, session);
        return new ResponseEntity<>(cartService.viewCartProduct(id), HttpStatus.OK);
    }

    @PostMapping("/qty")
    public CartProductResponseDto modifyCartQty(@RequestBody CartProductResponseDto responseDto, @CookieValue(value = "tempCart", required = false) Cookie tempCart, HttpServletResponse response, HttpSession session) {
        int id = getId(tempCart, response, session);
        responseDto.setUser_id(id);
        Cart cart = cartService.checkProductStock(responseDto.toEntity());
        responseDto.setPdt_qty(cart.getPdt_qty());
        if (responseDto.getPdt_qty() < 1) {
            responseDto.setPdt_qty(1);
        }
        cartService.modifyCart(responseDto.toEntity());
        return responseDto;
    }

    private int getId(Cookie tempCart, HttpServletResponse response, HttpSession session) {
        int id;
        MemberMainResponseDto memberMainResponseDto = (MemberMainResponseDto) session.getAttribute("memberResponse");
        if (Optional.ofNullable(memberMainResponseDto).isPresent()) {
            id = memberMainResponseDto.getUser_id();
        } else {
            id = cartService.getCookieId(tempCart, response);
        }
        return id;
    }
}
