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

    @GetMapping("/Vegetable")
    public String Vegetable(Model m, HttpServletRequest request, HttpSession session, String order_sc) {
        try {
            List<ProductDto> list = null;
            Map map = new HashMap();
            if (order_sc == null || order_sc == "") {
                list = productService.Vegetable(map);
            } else {
                map.put("order_sc", order_sc);
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/Vegetable";
    }

    @GetMapping("/EcoVegetable")
    public String EcoVegetable(Model m, HttpServletRequest request, HttpSession session, String order_sc) {
        try {
            List<ProductDto> list = null;
            Map map = new HashMap();
            if (order_sc == null || order_sc == "") {
                list = productService.EcoVegetable(map);
            } else {
                map.put("order_sc", order_sc);
                list = productService.ProductListDESC(map);
            }
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "goodslist";
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
    public ResponseEntity<Map> main(Integer sort, SearchCondition sc, Integer cd_name_num) {
        Map<String, Object> map = new HashMap<String, Object>();
        Paging ph = null;
        List list = null;
        try {
            int totalCnt = productService.getSearchResultCnt(sc);
            ph = new Paging(totalCnt, sc);
            if(cd_name_num!=null){
                list = productService.CodeNameSelect(cd_name_num, sc);
                System.out.println("list = " + list);
                map.put("totalCnt",totalCnt);
                map.put("ph",ph);
                map.put("list",list);
                return new ResponseEntity<Map>(map, HttpStatus.OK);
            }
            if (sort == 1) {
                list = productService.getSearchResultPage(sc);
                map.put("totalCnt", totalCnt);
                map.put("ph", ph);
                map.put("list", list);
            }else if(sort==2) {
                list = productService.ProductBestList(sc);
                map.put("totalCnt", totalCnt);
                map.put("ph", ph);
                map.put("list", list);
            }else if(sort==3) {
                list = productService.ProductThriftyList(sc);
                map.put("totalCnt", totalCnt);
                map.put("ph", ph);
                map.put("list", list);
                System.out.println("list = " + list);
            }else if(sort==0){
                List list1 = productService.mainlist("P001");
                List list2 = productService.mainlist("P002");
                List list3 = productService.mainlist("P003");
                List list4 = productService.mainlist("P004");
                List list5 = productService.mainlist("P005");
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

    @GetMapping("/categories")
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
        return "/product/list";
    }

    @GetMapping("/newlist")
    public String main(SearchCondition sc, String option, Model m, HttpServletRequest request, HttpSession session, String order_sc) {
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