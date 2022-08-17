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
        return "/home";
    }

    /**
     * temp
     */
    @GetMapping("logout")
    public String end(HttpSession session) {
        session.invalidate();
        return "/home";
    }

    /**
     * temp
     */
    @GetMapping("/add/{pdt_id}")
    public String addCart(@PathVariable Integer pdt_id, @CookieValue(value = "tempCart", required = false) Cookie tempCart, CartSaveRequestDto requestDto, HttpServletResponse response, HttpSession session) {
        Integer user_id = (Integer) session.getAttribute("user_id");
        if (Optional.ofNullable(user_id).isPresent()) {
            requestDto.saveCart(user_id, pdt_id, 1);
        } else {
            int cookieId = cartService.getCookieId(tempCart, response);
            System.out.println("add" + cookieId);
            requestDto.saveCart(cookieId, pdt_id, 1);
        }
        cartService.checkProductStock(requestDto.toEntity());
        cartService.addCart(requestDto);
        return "redirect:/carts/view";
    }

    @GetMapping("/view")
    public String viewCart(@CookieValue(value = "tempCart", required = false) Cookie tempCart, HttpServletResponse response, HttpSession session, Model model) {
        int id;
        Integer user_id = (Integer) session.getAttribute("user_id");
        if (Optional.ofNullable(user_id).isPresent()) {
            id = user_id;
        } else {
            id = cartService.getCookieId(tempCart, response);
            model.addAttribute("id", id);
        }
        cartService.viewCartProduct(id);
        return "/cart/cartRestApi";
    }

    @GetMapping("/delete")
    public String removeAllCart(HttpSession session) {
        cartService.removeCart((Integer) session.getAttribute("user_id"));
        return "redirect:/carts/view";
    }

    @GetMapping("/{ptd_id}")
    public String removeOneCart(@PathVariable Integer ptd_id, Cart cart, HttpSession session) {
        cart.updateCart((Integer) session.getAttribute("user_id"), ptd_id);
        cartService.removeOneCart(cart);
        return "redirect:/carts/view";
    }

    @GetMapping("/delete/checked")
    public String removeCheckedCart(List<Cart> cartList, HttpSession session) {
        for (Cart cart : cartList) {
            cart.setUser_id((Integer) session.getAttribute("user_id"));
        }
        cartService.removeCheckedCart(cartList);
        return "redirect:/carts/view";
    }
}
