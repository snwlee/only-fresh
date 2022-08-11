package com.devkurly.cart.controller;

import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.dto.CartUpdateRequestDto;
import com.devkurly.cart.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;

    @GetMapping("/1")
    public String viewCart(HttpSession session) {
        cartService.viewCart((Integer) session.getAttribute("user_id"));
        return "/cart/viewCart";
    }

    @PostMapping("/2")
    public String firstAddCart(CartSaveRequestDto requestDto) {
        cartService.addCart(requestDto);
        return "redirect:/carts";
    }

    @PostMapping("/3")
    public String secondAddCart(CartUpdateRequestDto requestDto) {
        cartService.modifyCart(requestDto);
        return "redirect:/carts";
    }

    @PostMapping("/4")
    public String deleteCart(HttpSession session, Integer ptd_id) {
        cartService.removeCart((Integer) session.getAttribute("user_id"), ptd_id);
        return "redirect:/carts";
    }
}
