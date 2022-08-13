package com.devkurly.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class TestController {

    // /review?pdt_id=1&bbs_clsf_cd=1&page=1&pageSize=10
    @GetMapping("/review")
    public String review() {

        return "board/review";
    }

}
