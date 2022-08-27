package com.devkurly.product.controller;

import com.devkurly.product.domain.Paging;
import com.devkurly.product.domain.SearchCondition;
import com.devkurly.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.Map;

@Controller
public class NewController {

    @Autowired
    ProductService productService;

    @GetMapping("/DevKurly") // DevKurly MainPage
    public String main() {
        return "MainPage";
    }

    @GetMapping("/goodslist") // /goodslist?cd_name='친환경'
    public String goodslist(Model m, SearchCondition sc){
        Paging ph = null;
        try {
            int totalCnt = productService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            ph = new Paging(totalCnt,sc);
            Map map = new HashMap();
            map.put("offset",sc.getOffset());
            map.put("pageSize",sc.getPageSize());
            m.addAttribute("ph",ph);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/goodslist";
    }
}
