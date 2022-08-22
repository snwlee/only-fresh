package com.devkurly.member.controller;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.service.CartService;
import com.devkurly.member.dto.*;
import com.devkurly.member.service.MemberService;
import com.devkurly.util.EncryptSha256;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;
    private final CartService cartService;

    @GetMapping("/test")
    public String test(@CookieValue(value = "tempCart", required = false) Cookie tempCart, CartSaveRequestDto cartSaveRequestDto, HttpServletResponse response, HttpSession session) {
        MemberSignInRequestDto signInRequestDto = new MemberSignInRequestDto("1234", "1234");
        MemberMainResponseDto memberResponse = memberService.signIn(signInRequestDto);
        session.setAttribute("memberResponse", memberResponse);
        cookieToLoginCart(tempCart, cartSaveRequestDto, response, session);
        return "redirect:/";
    }

    @GetMapping("/test2")
    public String test2(@CookieValue(value = "tempCart", required = false) Cookie tempCart, CartSaveRequestDto cartSaveRequestDto, HttpServletResponse response, HttpSession session) {
        MemberSignInRequestDto signInRequestDto = new MemberSignInRequestDto("pgrrr119@gmail.com", "1q2w3e4r%");
        MemberMainResponseDto memberResponse = memberService.signIn(signInRequestDto);
        session.setAttribute("memberResponse", memberResponse);
        cookieToLoginCart(tempCart, cartSaveRequestDto, response, session);
        return "redirect:/";
    }

    @GetMapping("")
    public String viewSignIn(HttpSession session) {
        Object sessionAttribute = session.getAttribute("memberResponse");
        if (sessionAttribute == null) {
            return "/member/signIn";
        }
        return "redirect:/";
    }

    @PostMapping("")
    public String postSignIn(@CookieValue(value = "tempCart", required = false) Cookie tempCart, CartSaveRequestDto cartSaveRequestDto, MemberSignInRequestDto requestDto, boolean rememberId, String toURL, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        MemberMainResponseDto memberResponse = memberService.signIn(requestDto);

        Cookie idCookie = new Cookie("email", requestDto.getUser_email());
        if (!rememberId) {
            idCookie.setMaxAge(0);
        }
        response.addCookie(idCookie);

        HttpSession requestSession = request.getSession();
        requestSession.setAttribute("memberResponse", memberResponse);

        cookieToLoginCart(tempCart, cartSaveRequestDto, response, session);
        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
    }

    @GetMapping("/signup")
    public String viewSignUp() {
        return "/member/signUp";
    }

    @PostMapping("/signup")
    public String postSignUp(@ModelAttribute @Valid MemberSaveRequestDto requestDto, BindingResult result) {
        if (result.hasErrors()) {
//            List<ObjectError> globalErrors = result.getGlobalErrors();
//            for (ObjectError ge : globalErrors) {
//                String simpleName = ValidMemberForm.class.getSimpleName();
//                System.out.println("simpleName = " + simpleName);
//                if (Objects.requireNonNull(ge.getCode()).equals(simpleName)) {
//                    result.rejectValue("cPassword", "Equal.pass", Objects.requireNonNull(ge.getDefaultMessage()));
//                }
//            }
            return "redirect:/members/signup";
        }
        memberService.join(requestDto);
        return "redirect:/members";
    }

    @GetMapping("/signout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("info/verify")
    public String viewVerifyMemberModify() {
        return "/member/verify";
    }

    @PostMapping("/info/verify")
    public String verifyMemberModify(String pwd, HttpSession session) {
        MemberMainResponseDto memberResponse = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = memberResponse.getUser_id();
        memberService.updatePassword(user_id, pwd);
        return "redirect:/members/info";
    }

    @GetMapping("/info")
    public String viewModifyMember(Model model, HttpSession session) {
        MemberMainResponseDto memberResponse = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = memberResponse.getUser_id();
        MemberUpdateResponseDto updateResponse = memberService.findUpdateMember(user_id);
        model.addAttribute("updateResponse", updateResponse);
        return "/member/update";
    }

    @PostMapping("/info")
    public String modifyMember(MemberUpdateRequestDto updateRequest, Model model, HttpSession session) {
        String prvPwd = updateRequest.getPwd();
        MemberUpdateResponseDto updateResponse = memberService.modifyMember(updateRequest);
        MemberMainResponseDto memberResponse = memberService.signIn(new MemberSignInRequestDto(updateRequest.getUser_email(), prvPwd));
        session.setAttribute("memberResponse", memberResponse);
        model.addAttribute("updateResponse", updateResponse);
        return "redirect:/members/info";
    }

    private void cookieToLoginCart(Cookie tempCart, CartSaveRequestDto cartSaveRequestDto, HttpServletResponse response, HttpSession session) {
        if (Optional.ofNullable(tempCart).isPresent()) {
            tempCart.setPath("/");
            tempCart.setMaxAge(0);
            response.addCookie(tempCart);
        }
        List<Cart> carts = cartService.viewAllCart(cartService.getCookieId(tempCart, response));
        for (Cart cart : carts) {
            MemberMainResponseDto memberResponse = (MemberMainResponseDto) session.getAttribute("memberResponse");
            cart.setUser_id(memberResponse.getUser_id());
            cartSaveRequestDto.saveCart(cart.getUser_id(), cart.getPdt_id(), cart.getPdt_qty());
            cartService.addCart(cartSaveRequestDto);
            cartService.removeCart(cartService.getCookieId(tempCart, response));
        }
    }
}
