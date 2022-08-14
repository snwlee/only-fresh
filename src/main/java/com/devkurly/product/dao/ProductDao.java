package com.devkurly.product.dao;

import com.devkurly.product.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductDao {
    int count() throws Exception
    ;


    int deleteAll() throws Exception;


    int delete(Integer pdt_id) throws Exception
    ;
    int insert(ProductDto dto) throws Exception;

    List<ProductDto> selectAll() throws Exception
    ;

    ProductDto select(Integer pdt_id) throws Exception // 상품 상세페이지
    ;

    List<ProductDto> selectPage(Map map) throws Exception // 상품 읽기
    ;

    int update(ProductDto dto) throws Exception // 상품 업데이트
    ;


}
