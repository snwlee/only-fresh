package com.devkurly.productDetail.controller;

import com.devkurly.board.domain.PageHandler;
import com.devkurly.board.service.BoardService;
import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.service.ProductService;
import com.devkurly.productDetail.dao.ProductDetailDao;
import com.devkurly.productDetail.domain.ProductDetailDto;
import com.devkurly.productDetail.service.ProductDetailService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/detail")
public class ProductDetailController {
    private ProductService productService;
    private ProductDetailService productDetailService;
    private BoardService boardService;

    public ProductDetailController(ProductService productService, ProductDetailService productDetailService, BoardService boardService) {
        this.productService = productService;
        this.productDetailService = productDetailService;
        this.boardService = boardService;
    }

    @RequestMapping("") // /detail?pdt_id=29
    public String DetailPage(Integer pdt_id ,Model model) {
        try {
            ProductDetailDto dto = productDetailService.selectDetail(pdt_id);
            int reviewCnt = boardService.getCount("1", pdt_id);
            model.addAttribute(dto);
            model.addAttribute("reviewCnt",reviewCnt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board/product_detail";
    }

    @RequestMapping("/admin")
    public String admin() {
        return "board/admin_productdetail";
    }

    @RequestMapping("/admin_board")
    public String adminBoard(Integer page, Integer pageSize, Model m) {
        try {
            int totalCnt = boardService.getNotRepliedCnt();
            PageHandler ph = new PageHandler(totalCnt, page, pageSize);
            m.addAttribute("totalCnt", totalCnt);
            m.addAttribute("ph", ph);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board/admin_board_answer";
    }

    @GetMapping("/list")
    public ResponseEntity<List<ProductDto>> getPdtid(Integer pdt_id, ProductDto productdto) {
        List<ProductDto> list = null;
        try {
            list = productService.selectProductId();
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/{pdt_id}")
    public ResponseEntity<ProductDetailDto> getProduct(@PathVariable Integer pdt_id) {

        try {
            ProductDetailDto productDetailDto = productDetailService.selectDetail(pdt_id);
            return new ResponseEntity<ProductDetailDto>(productDetailDto, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<ProductDetailDto>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/add")
    @ResponseBody
    public ResponseEntity<String> addDetail(@RequestBody ProductDetailDto productDetailDto) {

        Integer user_id = 1;
        productDetailDto.setUser_id(user_id);
        try {
            productDetailService.insert(productDetailDto);
            return new ResponseEntity<>("WRT_DETAIL_OK",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("WRT_DETAIL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @PatchMapping("/update")
    public ResponseEntity<ProductDetailDto> modifyDetail(@RequestBody ProductDetailDto productDetailDto) {
        Integer user_id = 1;
        productDetailDto.setUser_id(user_id);
        try {
            productDetailService.updateDetail(productDetailDto);
            return new ResponseEntity<ProductDetailDto>(productDetailDto, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<ProductDetailDto>(HttpStatus.BAD_REQUEST);
        }
    }
}
