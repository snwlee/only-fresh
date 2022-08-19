package com.devkurly.member.controller;

import com.devkurly.member.dto.MemberMainResponseDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberRestController {

    @GetMapping("/check")
    public MemberMainResponseDto memberCheck(HttpSession session) {
        return (MemberMainResponseDto) session.getAttribute("memberResponse");
    }
}
