package com.devkurly.product.controller;

import com.devkurly.product.domain.*;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/product")

public class ProductController {

    @Autowired
    ProductService productService;


    @PostMapping("/write")
    public ResponseEntity<String> write(ProductDto productDto, HttpSession session, RedirectAttributes rattr) {
        String in_user = (String) session.getAttribute("id");
        productDto.setIn_user(in_user);
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

    @GetMapping("/CateList")
    public String CateList(Model m, HttpServletRequest request, HttpSession session, String order_sc) {
        try {
            List<ProductDto> list = null;
            Map map = new HashMap();
            if (order_sc == null || order_sc == "") {
                list = productService.CateList(map);
                System.out.println("list = " + list);
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




    @GetMapping("/goodslist")
    public ResponseEntity<List> goodslist(Model m, String cd_name) {
        try {
            List<ProductDto> list = null;
            //Mapper에 있는 goodslist를 service까지 구현해서 cd_name을 매개값으로 적용(?)
            list = productService.goodslist(cd_name);
            return new ResponseEntity<List>(list, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List>(HttpStatus.BAD_REQUEST);
        }
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


    @GetMapping("/call")
    @ResponseBody
    public ResponseEntity<Map> main(Integer sort, SearchCondition sc, Integer cd_name_num, String cd_type_name, String AscBtn, String DescBtn) {
        Map<String, Object> map = new HashMap<String, Object>();
        List list = null;
        try {
            if(sort==null){
                if(cd_type_name!=null){ // 대분류 카테고리 코드
                    list = productService.cate(cd_type_name,sc);
                    map.put("cd_type_name",cd_type_name);
                    System.out.println("cd_type_name = " + cd_type_name);
                    map.put("list",list);
                    map.put("AscBtn",AscBtn);
                    map.put("DescBtn",DescBtn);
                }
                if(cd_name_num!=null){ // 소분류 카테고리 코드
                    list = productService.CodeNameSelect(cd_name_num,sc);
                    map.put("list",list);
                    map.put("AscBtn",AscBtn);
                    map.put("DescBtn",DescBtn);
                    String cd_name=productService.selectCate(cd_name_num);
                    map.put("cd_name",cd_name);
                }
                return new ResponseEntity<Map>(map, HttpStatus.OK);
            }
            if (sort == 1) { // 신상품
                list = productService.getSearchResultPage(sc);
                map.put("list", list);
                map.put("title","신상품");
                map.put("AscBtn",AscBtn);
                map.put("DescBtn",DescBtn);
            }else if(sort==2) { // 베스트
                list = productService.ProductBestList(sc);
                map.put("list", list);
                map.put("title","베스트");
                map.put("AscBtn",AscBtn);
                map.put("DescBtn",DescBtn);
            }else if(sort==3) { // 알뜰쇼핑
                list = productService.ProductThriftyList(sc);
                map.put("list", list);
                map.put("title","알뜰쇼핑");
                map.put("AscBtn",AscBtn);
                map.put("DescBtn",DescBtn);
            }
            else if(sort==0){ // 메인페이지

                List list1 = productService.mainlist("채소");
                List list2 = productService.mainlist("과일·견과·쌀");
                List list3 = productService.mainlist("수산·해산·건어물");
                List list4 = productService.mainlist("정육·계란");
                List list5 = productService.mainlist("국·반찬·메인요리");
                map.put("list1", list1);
                map.put("list2", list2);
                map.put("list3", list3);
                map.put("list4", list4);
                map.put("list5", list5);
            }
            return new ResponseEntity<Map>(map, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<Map>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/newlist") // 신상품, 베스트, 알뜰쇼핑
    public String mainStart(Integer sort, SearchCondition sc, Integer cd_name_num, String cd_type_name, Model m, Integer sel_price, String DescBtn,String AscBtn) {
        Paging ph = null;
        try {
            if (sort == null) {
                if (cd_type_name != null) { // 대분류 카테고리 코드
                    int totalCnt = productService.cateCnt(cd_type_name);
                    ph = new Paging(totalCnt, sc);
                    m.addAttribute("totalCnt", totalCnt);
                    m.addAttribute("ph", ph);
                }
                if (cd_name_num != null) { // 소분류 카테고리 코드
                    int totalCnt = productService.codeNameSelectCnt(cd_name_num);
                    ph = new Paging(totalCnt, sc);
                    m.addAttribute("totalCnt", totalCnt);
                    m.addAttribute("ph", ph);
                }
                return "product/productNewlist";
            }
            int totalCnt = productService.getSearchResultCnt(sc);
            ph = new Paging(totalCnt, sc);
            if (sort == 1) { // 신상품
                m.addAttribute("totalCnt", totalCnt);
                m.addAttribute("ph", ph);
            } else if (sort == 2) { // 베스트
                m.addAttribute("totalCnt", totalCnt);
                m.addAttribute("ph", ph);
            } else if (sort == 3) { // 알뜰쇼핑
                int total= productService.ThriftyCnt(sel_price);
                System.out.println("total = " + total);
                m.addAttribute("total",total);
                m.addAttribute("ph", ph);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/productNewlist";
    }

    @GetMapping("/categories") // 카테고리 기능
    @ResponseBody
    public ResponseEntity<Map<String, List<MainSubCatDto>>> getCategories(){
        Map<String, List<MainSubCatDto>> map = null;
        try {
            List<MainSubCatDto> list = productService.getMainSubCats();
            map = list.stream().collect(Collectors.groupingBy(MainSubCatDto::getCd_type_name));
            return new ResponseEntity<>(map, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
        }
    }



    @GetMapping("/list") //메인 페이지
    public String list(SearchCondition sc, String option, Model m, HttpServletRequest request, HttpSession session, String order_sc){
        Paging ph = null;
        try {
            int totalCnt = productService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);
            ph = new Paging(totalCnt,sc);
            List<ProductDto> list = null;
            if(order_sc==null || order_sc == ""){
                list = productService.getSearchResultPage(sc);
                Map map = new HashMap();
                map.put("order_sc",order_sc);
                map.put("offset",sc.getOffset());
                map.put("pageSize",sc.getPageSize());
                map.put("keyword",sc.getKeyword());
            }
            m.addAttribute("list", list);
            m.addAttribute("ph",ph);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/product/MainPage";
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