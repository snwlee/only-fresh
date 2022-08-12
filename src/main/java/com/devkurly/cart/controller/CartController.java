package com.devkurly.cart.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.dto.CartUpdateRequestDto;
import com.devkurly.cart.service.CartService;
import com.devkurly.product.dto.ProductDto;
import com.devkurly.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.function.IntToDoubleFunction;

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;
    private final ProductService productService;

    @GetMapping("login")
    public String start(HttpSession session) {
        session.setAttribute("user_id", 1);
        return "/home";
    }

    @GetMapping("/add/{pdt_id}")
    public String firstAddCart(CartSaveRequestDto requestDto, @PathVariable Integer pdt_id, HttpSession session) {
        Integer user_id = (Integer) session.getAttribute("user_id");
        try {
            requestDto.setUser_id(user_id);
            requestDto.setPdt_id(pdt_id);
            requestDto.setPdt_qty(1);
            cartService.addCart(requestDto);
        } catch (Exception e) {
            cartService.modifyAddCart(user_id, pdt_id);
            return "redirect:/carts/view";
        }
        return "redirect:/carts/view";
    }

    @GetMapping("/view")
    public String viewCart(HttpSession session, Model model) {
        List<CartResponseDto> cartList = cartService.viewCartProduct((Integer) session.getAttribute("user_id"));
        int sum = 0;
        for (CartResponseDto responseDto : cartList) {
            sum += responseDto.getSel_price() * responseDto.getPdt_qty();
        }
        model.addAttribute("sum", sum);
        model.addAttribute("cart", cartList);
        return "/cart/cart";
    }

    @GetMapping("/up/{pdt_id}")
    public String cartUp(@PathVariable Integer pdt_id, HttpSession session) {
        cartService.modifyAddCart((Integer) session.getAttribute("user_id"), pdt_id);
        return "redirect:/carts/view";
    }

    @GetMapping("/down/{pdt_id}")
    public String cartDown(@PathVariable Integer pdt_id, HttpSession session) {
        cartService.modifyRemoveCart((Integer) session.getAttribute("user_id"), pdt_id);
        return "redirect:/carts/view";
    }

    @GetMapping("/delete")
    public String deleteCart(HttpSession session) {
        cartService.removeCart((Integer) session.getAttribute("user_id"));
        return "redirect:/carts/view";
    }

    @GetMapping("/delete/{ptd_id}")
    public String deleteOneCart(@PathVariable Integer ptd_id, HttpSession session) {
        cartService.removeOneCart((Integer) session.getAttribute("user_id"), ptd_id);
        return "redirect:/carts/view";
    }
}
