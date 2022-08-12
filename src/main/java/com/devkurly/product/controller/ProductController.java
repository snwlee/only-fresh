package com.devkurly.product.controller;

import com.devkurly.product.dto.ProductDto;
import com.devkurly.product.page.ProductPage;
import com.devkurly.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    ProductService productService;


    @PostMapping("/write")
    public String write(ProductDto productDto, Model m , HttpSession session, RedirectAttributes rattr) {
        String in_user = (String)session.getAttribute("id");
        productDto.setIn_user(in_user);

        try {
            int rowCnt = productService.write(productDto); // insert

            if(rowCnt!=1)
                throw new Exception("Write failed");

            rattr.addFlashAttribute("msg", "WRT_OK");

            return "redirect:/product/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(productDto);
            m.addAttribute("msg", "WRT_ERR");
            return "product/product";
        }
    }
    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "product/product"; // 읽기와 쓰기에 사용. 쓰기에 사용할떄는 mode=new
    }

    @PostMapping("/remove")
    public String remove(Integer pdt_id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        String in_user = (String) session.getAttribute("id");
        try {
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            int rowCnt = productService.remove(pdt_id);
            if (rowCnt != 1)
                throw new Exception("product remove error");
            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/product/list";
    }



    @GetMapping("/read")
    public String read(Integer pdt_id, Integer page, Integer pageSize, Model m) {
        try {
              ProductDto productDto = productService.read(pdt_id);
                System.out.println("productDto = " + productDto);
                m.addAttribute("ProductDto",productDto);
              m.addAttribute("page",page);
              m.addAttribute("pagesize",pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
            return "product/product";
        }

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {

        if(page==null) page=1;
        if(pageSize==null) pageSize=10;

        try {
            int totalCnt = productService.getCount();
            ProductPage pageHandler = new ProductPage(totalCnt, page, pageSize);
            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<ProductDto> list = productService.getPage(map);
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "product/productlist";
    }


    @PostMapping("/modify")
    public String modify(ProductDto productDto, Model m , HttpSession session, RedirectAttributes rattr) {
        String in_user = (String)session.getAttribute("id");
        productDto.setIn_user(in_user);

        try {
            int rowCnt = productService.modify(productDto); // insert

            if(rowCnt!=1)
                throw new Exception("modify failed");

            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/product/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(productDto);
            m.addAttribute("msg", "WRT_ERR");
            return "product/product";
        }

    }
}
