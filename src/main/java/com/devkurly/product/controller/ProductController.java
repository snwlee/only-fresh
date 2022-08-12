package com.devkurly.product.controller;

import com.devkurly.product.dto.ProductDto;
import com.devkurly.product.pagehandler.PageHandler;
import com.devkurly.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    ProductService productService;

    @GetMapping("/read")
    public String read(Integer pdt_id, Integer page, Integer pageSize, Model m) {
        try {
          ProductDto productDto = productService.read(pdt_id);
            System.out.println("productDto = " + productDto);
            m.addAttribute(productDto);
          m.addAttribute("page",page);
          m.addAttribute("pagesize",pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "product";
        }

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {

        if(page==null) page=1;
        if(pageSize==null) pageSize=10;

        try {
            int totalCnt = productService.getCount();
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<ProductDto> list = productService.getPage(map);
            m.addAttribute("list", list);
            m.addAttribute("ph",pageHandler);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "productlist";
    }


}
