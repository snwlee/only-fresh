package com.devkurly.product.service;

import com.devkurly.product.domain.MainSubCatDto;
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

    List<ProductDto> ProductThriftyList(SearchCondition sc) throws Exception;

    List<ProductDto> ProductBestList(SearchCondition sc) throws Exception;

    List<ProductDto> ProductNewList(Map map) throws Exception;
    List<MainSubCatDto> getMainSubCats() throws Exception;
    int codeNameSelectCnt(Integer cd_name_num)throws Exception;

    int ThriftyCnt(Integer sel_price)throws Exception;

    List<ProductDto> selectProductId() throws Exception;
    // U
    int modify(ProductDto productDto) throws Exception;


    // D
    int remove(Integer pdt_id) throws Exception;

    List<ProductDto> EventList(Map map) throws Exception;


    List<ProductDto> ProductNewList(Map map, SearchCondition sc) throws Exception;

    List<ProductDto> ProductListDESC(SearchCondition sc, String order_sc)throws Exception;
    List<ProductDto> ProductListASC(SearchCondition sc)throws Exception;

    List<ProductDto> getSearchResultPage(SearchCondition sc) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;

    List<ProductDto> CateList(Map map) throws Exception;


    List<ProductDto> main(Map map, SearchCondition sc) throws Exception;


    List<ProductDto> mainlist(String cd_type_name) throws Exception;

    List<ProductDto> goodslist(String cd_name) throws  Exception;

    List<ProductDto> CodeNameSelect(SearchCondition sc, Integer cd_name_num, String order_sc, String asc) throws  Exception;

    List<ProductDto> cate(String cd_type_name, SearchCondition sc, String order_sc, String asc) throws Exception;

    int cateCnt(String cd_type_name) throws Exception;


    String selectCate(Integer cd_name_num) throws Exception;
}



















