package com.devkurly.product.service;

import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface ProductService {



    String isValid(ProductDto productDto) throws Exception;

    // C
    int write(ProductDto productDto) throws Exception;



    // R
    int getCount() throws Exception;


    List<ProductDto> ProductList(Map map) throws Exception;

    List<ProductDto> ProductThriftyList(Map map) throws Exception;

    List<ProductDto> ProductBestList(Map map) throws Exception;

    List<ProductDto> ProductNewList(Map map) throws Exception;



    List<ProductDto> selectProductId() throws Exception;
    // U
    int modify(ProductDto productDto) throws Exception;


    // D
    int remove(Integer pdt_id) throws Exception;

    List<ProductDto> EventList(Map map) throws Exception;

    List<ProductDto> ProductListDESC(Map map);

    List<ProductDto> getSearchResultPage(SearchCondition sc) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<ProductDto> CateList(Map map) throws Exception;

    List<ProductDto> Vegetable(Map map) throws Exception;

    List<ProductDto> EcoVegetable(Map map) throws Exception;

    List<ProductDto> main(Map map) throws Exception;


    List<ProductDto> mainlist(String cd_type_id) throws Exception;

    List<ProductDto> goodslist(String cd_name) throws  Exception;

    List<ProductDto> CodeNameSelect(Integer cd_name_num, SearchCondition sc) throws  Exception;
}



















