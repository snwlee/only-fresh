package com.devkurly.productDetail.dao;

import com.devkurly.productDetail.domain.ProductDetailDto;

import java.util.Map;

public interface ProductDetailDao {

    ProductDetailDto select(Integer pdt_id) throws Exception;
    int insert(ProductDetailDto dto) throws Exception;
    int update(ProductDetailDto dto) throws Exception;

}
