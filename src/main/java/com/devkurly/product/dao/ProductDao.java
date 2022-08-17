package com.devkurly.product.dao;

import com.devkurly.product.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductDao {


    // C

    int insert(ProductDto dto) throws Exception;



    // R

    List<ProductDto> ProductList(Map map) throws Exception;// 상품 리스트

    List<ProductDto> ProductThriftylist(Map map) throws Exception;

    // R
    List<ProductDto> ProductBestlist(Map map) throws Exception;

    List<ProductDto> ProductNewList(Map map) throws Exception;

    ProductDto select(Integer pdt_id) throws Exception; // 상품 상세페이지
    int count() throws Exception;

    // U

    int update(ProductDto dto) throws Exception // 상품 업데이트
    ;



    // D

    int deleteAll() throws Exception;

    int delete(Integer pdt_id) throws Exception;


    List<ProductDto> ProductListDESC(Map map);

    List<ProductDto> selectProductId() throws Exception;
}
