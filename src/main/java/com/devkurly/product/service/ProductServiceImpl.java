package com.devkurly.product.service;

import com.devkurly.product.dao.*;
import com.devkurly.product.domain.MainSubCatDto;
import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.domain.SearchCondition;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ProductServiceImpl implements ProductService {
    public ProductServiceImpl(){}
    @Autowired
    ProductDao productDao;

    @Override
    public int getCount() throws Exception {
        return productDao.count();
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer pdt_id) throws Exception {
        productDao.delete(productDao.delete(pdt_id));
        int list = productDao.delete(pdt_id);
        return productDao.delete(pdt_id);
    }

    @Override
    public List<ProductDto> EventList(Map map) throws Exception {
        return productDao.EventList(map);
    }




    @Override
    public String isValid(ProductDto productDto) throws Exception {
        return null;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(ProductDto productDto) throws Exception {
        return productDao.create(productDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int modify(ProductDto productDto) throws Exception {
        productDao.update(productDto);
        int list = productDao.update(productDto);
        return productDao.update(productDto);
    }
    @Override
    public List<ProductDto> selectProductId() throws Exception {//board용 남겨주세요.
        return productDao.selectProductId();
    }


    @Override
    public List<ProductDto> ProductList(Map map) throws Exception { // 상품 리스트
        return productDao.ProductList(map);
    }

    @Override
    public List<ProductDto> ProductThriftyList(SearchCondition sc) throws Exception { // 알뜰상품
       Map map = new HashMap<>();
       map.put("offset", sc.getOffset());
       map.put("pageSize", sc.getPageSize());
        return productDao.ProductThriftyList(map);
    }

 @Override
 public List<ProductDto> ProductBestList(SearchCondition sc) throws  Exception { // 베스트상품
        Map map = new HashMap<>();
        map.put("offset",sc.getOffset());
        map.put("pageSize",sc.getPageSize());
        return productDao.ProductBestList(map);
 }


    @Override
    public List<ProductDto> ProductNewList(Map map) throws Exception { // 신상품
        return productDao.ProductNewList(map);
    }

    @Override
    public List<ProductDto> ProductListDESC(Map map) {
        return productDao.ProductListDESC(map);
    }

    @Override
    public List<ProductDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return productDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return productDao.searchResultCnt(sc);
    }

    @Override
    public List<ProductDto> CateList(Map map) throws Exception {
        return productDao.CateList(map);
    }

    @Override
    public List<MainSubCatDto> getMainSubCats() throws Exception{
        return productDao.getCatList();
    }

    @Override
    public List<ProductDto> Vegetable(Map map) throws Exception {
        return productDao.Vegetable(map);
    }
        @Override
        public List<ProductDto> EcoVegetable(Map map) throws Exception {
            return productDao.EcoVegetable(map);

    }


    @Override
    public List<ProductDto> main(Map map) throws Exception {
        return productDao.main(map);
    }

    @Override
    public List<ProductDto> mainlist(String cd_type_name) throws Exception {
        return productDao.mainlist(cd_type_name);
    }

    @Override
    public List<ProductDto> goodslist(String cd_name) throws Exception {
        return productDao.goodslist(cd_name);
    }

    @Override
    public List<ProductDto> CodeNameSelect(Integer cd_name_num, SearchCondition sc) throws  Exception {
        return productDao.CodeNameSelect(sc,cd_name_num);
    }
    @Override
    public int codeNameSelectCnt(Integer cd_name_num)throws Exception {
        return productDao.codeNameSelectCnt(cd_name_num);
    }

    @Override
    public List<ProductDto> cate(String cd_type_name, SearchCondition sc) throws Exception {
        return productDao.cate(cd_type_name, sc);
    }
        @Override
        public int cateCnt(String cd_type_name) throws Exception {
            return productDao.cateCnt(cd_type_name);
    }



//    @Override
//    public String isValid(ProductDto productDto) throws Exception {
//        if (productDto.getPdt_id() != null || productDto.getTitle().length() > 50 || productDto.getImage().length() > 255 ||
//                productDto.getSub_title().length() > 50 || productDto.getRec_info().length() > 50 ||
//                productDto.getSales_rate() == null) {
//            throw new Exception(String.valueOf(HttpStatus.BAD_REQUEST));
//        }
//        return null;
    }



