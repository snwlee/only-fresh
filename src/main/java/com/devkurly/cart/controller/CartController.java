package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.dto.CartUpdateRequestDto;
import com.devkurly.cart.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;

    @GetMapping("login")
    public String start(HttpSession session) {
        session.setAttribute("user_id", 1);
        return "/home";
    }

    @GetMapping("/add")
    public String firstAddCart(CartSaveRequestDto requestDto) {
        try {
            requestDto.setUser_id(1);
            requestDto.setPdt_id(2);
            requestDto.setPdt_qty(1);
            cartService.addCart(requestDto);
        } catch (Exception e) {
            requestDto.setPdt_qty(requestDto.getPdt_qty() + 1);
            cartService.modifyCart(requestDto);
            return "redirect:/carts/view";
        }
        return "redirect:/carts/view";
    }

    @GetMapping("/view")
    public String viewCart(HttpSession session, Model model) {
        List<Cart> cartList = cartService.viewCart((Integer) session.getAttribute("user_id"));
        model.addAttribute(cartList);
        return "/cart/cart";
    }

    @GetMapping("/update")
    public String secondAddCart(CartSaveRequestDto requestDto) {
        requestDto.setPdt_qty(2020);
        cartService.modifyCart(requestDto);
        return "redirect:/carts/view";
    }

    @GetMapping("/delete")
    public String deleteCart(HttpSession session, Integer ptd_id) {
        cartService.removeCart((Integer) session.getAttribute("user_id"), ptd_id);
        return "redirect:/carts/view";
    }
}
