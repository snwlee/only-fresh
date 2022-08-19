package com.devkurly.productDetail.controller;

import com.devkurly.product.domain.ProductDto;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/detail")
public class ProductDetailController {

    @GetMapping("")
    public String list(Integer pdt_id, ProductDto productodto) {

        return "board/productDetail";
    }

}
