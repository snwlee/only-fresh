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
import java.util.Optional;
import java.util.function.IntToDoubleFunction;

@Controller
@RequiredArgsConstructor
@RequestMapping("/carts")
public class CartController {

    private final CartService cartService;
    private final ProductService productService;

    /*
     * temp
     */
    @GetMapping("login")
    public String start(HttpSession session) {
        session.setAttribute("user_id", 1);
        return "/home";
    }

    /*
     * temp
     */
    @GetMapping("/add/{pdt_id}")
    public String addCart(CartSaveRequestDto requestDto, @PathVariable Integer pdt_id, HttpSession session) {
        Integer user_id = (Integer) session.getAttribute("user_id");
        try {
            requestDto.setUser_id(user_id);
            requestDto.setPdt_id(pdt_id);
            requestDto.setPdt_qty(1);
            cartService.addCart(requestDto);
        } catch (Exception e) {
            Cart cart = cartService.viewCart(requestDto.toEntity());
            cart.setPdt_qty(cart.getPdt_qty() + 1);
            cartService.modifyCart(cart);
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

    @PostMapping("/plus")
    @ResponseBody
    public Cart cartPlus(@RequestBody Cart cart) {
//        cart.setPdt_qty(cartService.viewCart(cart).getPdt_qty() + 1);
        cartService.modifyCart(cart);
        return cart;
    }

    @PostMapping("/minus")
    @ResponseBody
    public Cart cartMinus(@RequestBody Cart cart) {
        cart.setPdt_qty(cartService.viewCart(cart).getPdt_qty() - 1);
        cartService.modifyCart(cart);
        return cart;
    }
}
