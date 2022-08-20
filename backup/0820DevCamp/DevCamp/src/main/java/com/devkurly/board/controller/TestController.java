package com.devkurly.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class TestController {

    // /review?pdt_id=1
    @GetMapping("/review")
    public String review(Integer pdt_id, Model m) {
        m.addAttribute("pdt_id", pdt_id);
        m.addAttribute("bbs_clsf_cd", 1);
        m.addAttribute("page", 1);
        m.addAttribute("pageSize", 10);
        return "board/review";
    }

}
