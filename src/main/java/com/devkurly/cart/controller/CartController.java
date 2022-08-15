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

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;

    /**
     * temp
     */
    @GetMapping("login")
    public String start(HttpSession session) {
        session.setAttribute("user_id", 1);
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
//        String user_id = (String) session.getAttribute("user_id");
//        try {
//            requestDto.setUser_id(user_id);
//            requestDto.setPdt_id(pdt_id);
//            requestDto.setPdt_qty(1);
//            cartService.addCart(requestDto);
//        } catch (Exception e) {
//            Cart cart = cartService.viewCart(requestDto.toEntity());
//            cart.setPdt_qty(cart.getPdt_qty() + 1);
//            cartService.modifyCart(cart);
//            return "redirect:/carts/view";
//        }
        requestDto.setUser_id(sessionId);
        requestDto.setPdt_id(pdt_id);
        requestDto.setPdt_qty(1);
        cartService.addCart(requestDto);
        return "redirect:/carts/view";
    }

    @GetMapping("/view")
    public String viewCart(@CookieValue("JSESSIONID") String sessionId, Model model) {
        System.out.println("sessionId1 = " + sessionId);
        model.addAttribute("sessionId", sessionId);
        cartService.viewCartProduct(sessionId);
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
