package com.devkurly.product.controller;

import com.devkurly.product.domain.Paging;
import com.devkurly.product.domain.ProductDto;

import com.devkurly.product.domain.SearchCondition;
import com.devkurly.product.service.ProductService;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/product")

public class ProductController {

    @Autowired
    ProductService productService;


    @PostMapping("/write")
    public ResponseEntity<String> write(ProductDto productDto, Model m , HttpSession session, RedirectAttributes rattr) {
        String in_user = (String) session.getAttribute("id");
        productDto.setIn_user(in_user);
        System.out.println("productDto = " + productDto);
        try {
            productService.write(productDto); // insert
            return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "product/product"; // 읽기와 쓰기에 사용. 쓰기에 사용할떄는 mode=new
    }

    @DeleteMapping("/remove")
    public ResponseEntity<String> remove(@PathVariable Integer pdt_id, HttpSession session) {
        String in_user = (String) session.getAttribute("id");
        try {
            int rowCnt = productService.remove(pdt_id);
            if (rowCnt != 1)
                throw new Exception("delete error");
            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }


//    @GetMapping("/read")
//    public String read(Integer pdt_id, Integer page, Integer pageSize, Model m) {
//        try {
//            ProductDto productDto = productService.read(pdt_id);
//            m.addAttribute("ProductDto",productDto);
//            m.addAttribute("page",page);
//            m.addAttribute("pagesize",pageSize);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "product/product";
//    }

    @GetMapping("/CateList")
    public String CateList( Model m, HttpServletRequest request, HttpSession session, String order_sc){
        try {
            List<ProductDto> list = null;
            Map map = new HashMap();
            if (order_sc == null || order_sc == "") {
                list = productService.CateList(map);
            } else {
                map.put("order_sc", order_sc);
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/productCateList";
    }


    @GetMapping("/EventList")
    public String EventList( Model m, HttpServletRequest request, HttpSession session, String order_sc){
        try {
            List<ProductDto> list = null;
            Map map = new HashMap();
            if (order_sc == null || order_sc == "") {
                list = productService.EventList(map);
            } else {
                map.put("order_sc", order_sc);
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/productEventList";
    }




    @GetMapping("/list")

    public String list(SearchCondition sc, String option, Model m, HttpServletRequest request, HttpSession session, String order_sc){
        Paging ph = null;
        try {
            int totalCnt = productService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            ph = new Paging(totalCnt,sc);
            List<ProductDto> list = null;

            if(order_sc==null || order_sc == ""){
                list = productService.getSearchResultPage(sc);
            }else{
                Map map = new HashMap();
                map.put("order_sc",order_sc);
                map.put("offset",sc.getOffset());
                map.put("pageSize",sc.getPageSize());
                map.put("keyword",sc.getKeyword());
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
            m.addAttribute("ph",ph);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/productlist";
    }

    @GetMapping("/newlist")

    public String newlist(SearchCondition sc, String option, Model m, HttpServletRequest request, HttpSession session, String order_sc){
        Paging ph = null;
        try {
            int totalCnt = productService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            ph = new Paging(totalCnt,sc);
            List<ProductDto> list = null;

            if(order_sc==null || order_sc == ""){
                list = productService.getSearchResultPage(sc);
            }else{
                Map map = new HashMap();
                map.put("order_sc",order_sc);
                map.put("offset",sc.getOffset());
                map.put("pageSize",sc.getPageSize());
                map.put("keyword",sc.getKeyword());
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
            m.addAttribute("ph",ph);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/productNewlist";
    }

    @GetMapping("/bestlist")

    public String bestlist(SearchCondition sc, String option, Model m, HttpServletRequest request, HttpSession session, String order_sc){
        Paging ph = null;
        try {
            int totalCnt = productService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            ph = new Paging(totalCnt,sc);
            List<ProductDto> list = null;

            if(order_sc==null || order_sc == ""){
                list = productService.getSearchResultPage(sc);
            }else{
                Map map = new HashMap();
                map.put("order_sc",order_sc);
                map.put("offset",sc.getOffset());
                map.put("pageSize",sc.getPageSize());
                map.put("keyword",sc.getKeyword());
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
            m.addAttribute("ph",ph);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "product/productBestlist";
    }




    @GetMapping("/thriftylist")
    public String thriftylist(SearchCondition sc, String option, Model m, HttpServletRequest request, HttpSession session, String order_sc){
        Paging ph = null;
        try {
            int totalCnt = productService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            ph = new Paging(totalCnt,sc);
            List<ProductDto> list = null;

            if(order_sc==null || order_sc == ""){
                list = productService.getSearchResultPage(sc);
            }else{
                Map map = new HashMap();
                map.put("order_sc",order_sc);
                map.put("offset",sc.getOffset());
                map.put("pageSize",sc.getPageSize());
                map.put("keyword",sc.getKeyword());
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
            m.addAttribute("ph",ph);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/productThriftylist";
    }

    @PatchMapping("/modify")
    public ResponseEntity<String> modify(ProductDto productDto, Model m , HttpSession session, RedirectAttributes rattr) {
        String in_user = (String)session.getAttribute("id");
        productDto.setIn_user(in_user);

        try {
            int rowCnt = productService.modify(productDto); // insert
            if(rowCnt!=1)
                throw new Exception("modify failed");
            return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);

        }

    }
}
