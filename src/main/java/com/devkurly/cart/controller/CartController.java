package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;

    /**
     * temp
     */
    @GetMapping("login")
    public String start(@CookieValue(value = "tempCart", required = false) Cookie tempCart, CartSaveRequestDto requestDto, HttpServletResponse response, HttpSession session) {
        if (Optional.ofNullable(tempCart).isPresent()) {
            tempCart.setPath("/");
            tempCart.setMaxAge(0);
            response.addCookie(tempCart);
        }
        session.setAttribute("user_id", 1);
        List<Cart> carts = cartService.viewAllCart(cartService.getCookieId(tempCart, response));
        for (Cart cart : carts) {
            Integer user_id = (Integer) session.getAttribute("user_id");
            cart.setUser_id(user_id);
            requestDto.saveCart(cart.getUser_id(), cart.getPdt_id(), cart.getPdt_qty());
            cartService.addCart(requestDto);
            cartService.removeCart(cartService.getCookieId(tempCart, response));
        }
        return "redirect:/";
    }

    /**
     * temp
     */
    @GetMapping("logout")
    public String end(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("")
    public String viewCart(@CookieValue(value = "tempCart", required = false) Cookie tempCart, HttpServletResponse response, HttpSession session, Model model) {
        int id = getId(tempCart, response, session);
        model.addAttribute("id", id);
        cartService.viewCartProduct(id);
        return "cart/cart";
    }

    @PostMapping("/{pdt_id}")
    public String addCart(@PathVariable Integer pdt_id, @CookieValue(value = "tempCart", required = false) Cookie tempCart, CartSaveRequestDto requestDto, HttpServletResponse response, HttpSession session) {
        int id = getId(tempCart, response, session);
        requestDto.saveCart(id, pdt_id);
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

    /**
     * temp
     */
    @GetMapping("/delete/checked")
    public String removeCheckedCart(@CookieValue(value = "tempCart", required = false) Cookie tempCart, List<Cart> cartList, HttpServletResponse response, HttpSession session) {
        int id = getId(tempCart, response, session);
        for (Cart cart : cartList) {
            cart.setUser_id(id);
        }
        cartService.removeCheckedCart(cartList);
        return "redirect:/carts";
    }

    private int getId(Cookie tempCart, HttpServletResponse response, HttpSession session) {
        int id;
        Integer user_id = (Integer) session.getAttribute("user_id");
        if (Optional.ofNullable(user_id).isPresent()) {
            id = user_id;
        } else {
            id = cartService.getCookieId(tempCart, response);
        }
        return id;
    }
}
