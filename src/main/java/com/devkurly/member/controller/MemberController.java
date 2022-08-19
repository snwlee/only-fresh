package com.devkurly.member.controller;

import com.devkurly.member.dto.MemberSaveRequestDto;
import com.devkurly.member.dto.ValidMemberForm;
import com.devkurly.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;

    @GetMapping("")
    public String viewSignIn(HttpSession session) {
        Object sessionAttribute = session.getAttribute("user_id");
        if (sessionAttribute == null) {
            return "/member/signIn";
        }
        return "redirect:/";
    }

    @PostMapping("")
    public String postSignIn(String email, String password, boolean rememberId, String toURL, HttpServletRequest request, HttpServletResponse response) {

        Integer user_id = memberService.signIn(email, password);

        Cookie idCookie = new Cookie("email", email);
        if (!rememberId) {
            idCookie.setMaxAge(0);
        }
        response.addCookie(idCookie);

        HttpSession session = request.getSession();
        session.setAttribute("user_id", user_id);

        toURL = toURL == null || toURL.equals("") ? "/" : toURL;
        return "redirect:" + toURL;
    }

    @GetMapping("/signup")
    public String viewSignUp() {
        System.out.println("GET");
        return "/member/signUp";
    }

    @PostMapping("/signup")
    public String postSignUp(@ModelAttribute @Valid MemberSaveRequestDto requestDto, BindingResult result) {
        System.out.println("POST");
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
        System.out.println("requestDto.getCPassword() = " + requestDto.getCPassword());
        memberService.join(requestDto);
        return "redirect:/members";
    }
}
