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
import java.net.http.HttpResponse;
import java.util.List;
import java.util.Objects;
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
    public String start(@CookieValue("JSESSIONID") String sessionId,CartSaveRequestDto requestDto, HttpSession session) {
        session.setAttribute("user_id", 1);
        List<Cart> carts = cartService.viewAllCart(sessionId);
        for (Cart cart : carts) {
            String user_id = session.getAttribute("user_id").toString();
            cart.setUser_id(user_id);
            requestDto.saveCart(cart.getUser_id(), cart.getPdt_id(), cart.getPdt_qty());
            cartService.addCart(requestDto);
            cartService.removeCart(sessionId);
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
    public String addCart(@PathVariable Integer pdt_id, @CookieValue("JSESSIONID") String sessionId, CartSaveRequestDto requestDto, HttpSession session) {
        Object user_id = session.getAttribute("user_id");
        if (Optional.ofNullable(user_id).isPresent()) {
            requestDto.saveCart(user_id.toString(), pdt_id, 1);
        } else {
            requestDto.saveCart(sessionId, pdt_id, 1);
        }
        cartService.checkProductStock(requestDto.toEntity());
        cartService.addCart(requestDto);
        return "redirect:/carts/view";
    }

    @GetMapping("/view")
    public String viewCart(@CookieValue("JSESSIONID") String sessionId, HttpSession session, Model model) {
        String id;
        Object user_id = session.getAttribute("user_id");
        if (Optional.ofNullable(user_id).isPresent()) {
            id = user_id.toString();
        } else {
            id = sessionId;
            model.addAttribute("sessionId", sessionId);
        }
        cartService.viewCartProduct(id);
        return "/cart/cartRestApi";
    }

    @GetMapping("/delete")
    public String removeAllCart(HttpSession session) {
        cartService.removeCart((String) session.getAttribute("user_id"));
        return "redirect:/carts/view";
    }

    @GetMapping("/{ptd_id}")
    public String removeOneCart(@PathVariable Integer ptd_id, Cart cart, HttpSession session) {
        cart.updateCart((String) session.getAttribute("user_id"), ptd_id);
        cartService.removeOneCart(cart);
        return "redirect:/carts/view";
    }

    @GetMapping("/delete/checked")
    public String removeCheckedCart(List<Cart> cartList, HttpSession session) {
        for (Cart cart : cartList) {
            cart.setUser_id((String) session.getAttribute("user_id"));
        }
        cartService.removeCheckedCart(cartList);
        return "redirect:/carts/view";
    }
}
