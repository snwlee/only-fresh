package com.devkurly.member.controller;

import com.devkurly.address.domain.AddressDto;
import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.service.CartService;
import com.devkurly.member.domain.Member;
import com.devkurly.member.dto.*;
import com.devkurly.member.exception.SignInException;
import com.devkurly.member.service.MemberService;
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
import java.util.HashMap;
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
    public String postSignUp(@ModelAttribute @Valid MemberSaveRequestDto requestDto,AddressDto addressDto, BindingResult result) {
        System.out.println("addressDto.getMain_addr() = " + addressDto.getMain_addr());
        System.out.println("addressDto.getSub_addr() = " + addressDto.getSub_addr());
        if (result.hasErrors()) {
//            List<ObjectError> globalErrors = result.getGlobalErrors();
//            for (ObjectError ge : globalErrors) {
//                String simpleName = ValidMemberForm.class.getSimpleName();
//                System.out.println("simpleName = " + simpleName);
//                if (Objects.requireNonNull(ge.getCode()).equals(simpleName)) {
//                    result.rejectValue("cPassword", "Equal.pass", Objects.requireNonNull(ge.getDefaultMessage()));
//                }
//            }
            return "redirect:/members/signup?error=3";
        }
        memberService.join(requestDto);
        MemberMainResponseDto memberResponse = memberService.findUserId(new MemberSignInRequestDto(requestDto.getUser_email(), requestDto.getPwd()));
        addressDto.setUser_id(memberResponse.getUser_id());
        addressDto.setAddr_name(requestDto.getUser_nm());
        addressDto.setAddr_tel(requestDto.getTelno());
        memberService.saveDefaultAddress(addressDto);
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
        Integer user_id = getMemberResponse(session);
        memberService.updatePassword(user_id, pwd);
        return "redirect:/members/info";
    }

    @GetMapping("/info")
    public String viewModifyMember(Model model, HttpSession session) {
        Integer user_id = getMemberResponse(session);
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
        List<Cart> carts = cartService.viewAllCart(cartService.getCookieId(tempCart));
        for (Cart cart : carts) {
            cart.setUser_id(getMemberResponse(session));
            cartSaveRequestDto.saveCart(cart.getUser_id(), cart.getPdt_id(), cart.getPdt_qty());
            cartService.addCart(cartSaveRequestDto);
            cartService.removeCart(cartService.getCookieId(tempCart));
        }
        if (Optional.ofNullable(tempCart).isPresent()) {
            tempCart.setPath("/");
            tempCart.setMaxAge(0);
            response.addCookie(tempCart);
        }
    }

    @GetMapping("/kakao")
    public String sns(@RequestParam(value = "code", required = false) String code, MemberKakaoResponseDto responseDto, HttpSession session, Model model) {
        String access_Token = memberService.getAccessToken(code);
        HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
        String email = (String) userInfo.get("email");
        try {
            MemberMainResponseDto memberResponse = memberService.kakaoSignIn(email);
            session.setAttribute("memberResponse", memberResponse);
            return "redirect:/";
        } catch (SignInException e) {
            String name = (String) userInfo.get("nickname");
            String gender = (String) userInfo.get("gender");
            responseDto.setUser_email(email);
            responseDto.setUser_nm(name);
            responseDto.setGender(gender);
            model.addAttribute("kakao", responseDto);
            return "/member/signUp";
        }
    }

    public static Integer getMemberResponse(HttpSession session) {
        return ((MemberMainResponseDto) session.getAttribute("memberResponse")).getUser_id();
    }
}
