package com.devkurly.product.dao;

import com.devkurly.product.domain.MainSubCatDto;
import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface ProductDao {


    // C

    int create(ProductDto dto) throws Exception;



    // R

    List<ProductDto> ProductList(Map map) throws Exception;// 상품 리스트

    List<ProductDto> ProductThriftyList(Map map) throws Exception;

    // R
    List<ProductDto> ProductBestList(Map map) throws Exception;

    List<ProductDto> ProductNewList(Map map) throws Exception;

    List<MainSubCatDto> getCatList() throws Exception;

    int codeNameSelectCnt(Integer cd_name_num)throws Exception;

    int count() throws Exception;

    int ThriftyCnt(Integer sel_price)throws Exception;

    // U

    int update(ProductDto dto) throws Exception // 상품 업데이트
    ;



    // D

    int deleteAll() throws Exception;

    int delete(Integer pdt_id) throws Exception;


    List<ProductDto> selectProductId() throws Exception;

    List<ProductDto> ProductListDESC(Map map)throws Exception; // 정렬

    List<ProductDto> ProductListASC(Map map) throws Exception;
     List<ProductDto> searchSelectPage(SearchCondition sc) throws Exception;

     int searchResultCnt(SearchCondition sc) throws Exception;

    List<ProductDto> EventList(Map map) throws Exception;

    List<ProductDto> CateList(Map map) throws Exception;

    List<ProductDto> Vegetable(Map map) throws Exception;

    List<ProductDto> EcoVegetable(Map map) throws Exception;

    List<ProductDto> main(Map map, SearchCondition sc) throws Exception;

    List<ProductDto> mainlist(String cd_type_name) throws Exception;

    List<ProductDto> goodslist(String cd_name) throws Exception;

    List<ProductDto> CodeNameSelect(SearchCondition sc, Integer cd_name_num, String order_sc, String asc) throws Exception;

    List<ProductDto> cate(String cd_type_name, SearchCondition sc, String order_sc, String asc) throws Exception;

    int cateCnt(String cd_type_name) throws Exception;

    String selectCate(Integer cd_name_num) throws Exception;
}
