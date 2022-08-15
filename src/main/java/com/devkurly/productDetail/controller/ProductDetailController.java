package com.devkurly.productDetail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/detail")
public class ProductDetailController {

    @GetMapping("")
    public String test2() {
        return "productDetail";
    }

}
