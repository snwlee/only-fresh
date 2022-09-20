package com.devkurly.member.controller;

import com.devkurly.member.dto.MemberMainResponseDto;
import com.devkurly.member.dto.MemberUpdateResponseDto;
import com.devkurly.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

import java.util.List;

import static com.devkurly.member.controller.MemberController.getMemberResponse;

@RestController
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberRestController {

    private final MemberService memberService;

    @GetMapping("/check")
    public MemberMainResponseDto memberCheck(HttpSession session) {
        return (MemberMainResponseDto) session.getAttribute("memberResponse");
    }

    @GetMapping("/value")
    public MemberUpdateResponseDto memberUpdateResponse(HttpSession session) {
        return memberService.findUpdateMember(getMemberResponse(session));
    }

    @GetMapping("/duplicate")
    public ResponseEntity<String> duplicateMemberCheck(@RequestParam(value="email" , required = false) String email) {
        memberService.findMemberEmail(email);
        return ResponseEntity.ok().body("사용 가능한 이메일 입니다.");
    }
}
