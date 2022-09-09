package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.exception.MaxCartException;
import com.devkurly.cart.service.CartService;
import com.devkurly.global.ErrorCode;
import com.devkurly.member.dto.MemberMainResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;

    @GetMapping("")
    public String viewCart() {
        return "/cart/cart";
    }

    @PostMapping("/{pdt_id}")
    public String addCart(@PathVariable Integer pdt_id, @CookieValue(value = "tempCart", required = false) Cookie tempCart, CartSaveRequestDto requestDto, HttpServletResponse response, HttpSession session) {
        if (requestDto.getPdt_qty() < 1) {
            requestDto.setPdt_qty(1);
        }
        int id = getId(tempCart, response, session);
        requestDto.saveCart(id, pdt_id);
//        cartService.checkAddProductStock(requestDto.toEntity());
        cartService.checkProductStock(requestDto.toEntity());
        cartService.addCart(requestDto);
        return "redirect:/carts";
    }

    @GetMapping("/delete")
    public String removeAllCart(@CookieValue(value = "tempCart", required = false) Cookie tempCart, HttpServletResponse response, HttpSession session) {
        int id = getId(tempCart, response, session);
        cartService.removeCart(id);
        return "redirect:/carts";
    }

    @GetMapping("/delete/{ptd_id}")
    public String removeOneCart(@PathVariable Integer ptd_id, @CookieValue(value = "tempCart", required = false) Cookie tempCart, Cart cart, HttpServletResponse response, HttpSession session) {
        int id = getId(tempCart, response, session);
        cart.updateCart(id, ptd_id);
        cartService.removeOneCart(cart);
        return "redirect:/carts";
    }

    @GetMapping("/delete/checked")
    public String removeCheckedCart(@CookieValue(value = "tempCart", required = false) Cookie tempCart, @RequestParam(value = "checked", required = false) List<String> chArr, HttpServletResponse response, HttpSession session) {
        int id = getId(tempCart, response, session);
        List<Cart> cartList = new ArrayList<>();
        for (String s : chArr) {
            int pdt_id = Integer.parseInt(s);
            Cart cart = new Cart();
            cart.updateCart(id, pdt_id);
            cartList.add(cart);
        }
        cartService.removeCheckedCart(cartList);
        return "redirect:/carts";
    }

    private int getId(Cookie tempCart, HttpServletResponse response, HttpSession session) {
        int id;
        MemberMainResponseDto memberResponse = (MemberMainResponseDto) session.getAttribute("memberResponse");
        if (Optional.ofNullable(memberResponse).isPresent()) {
            id = memberResponse.getUser_id();
        } else {
            id = cartService.getCookieId(tempCart, response);
        }
        return id;
    }
}
