package com.devkurly.productDetail.dao;

import com.devkurly.productDetail.domain.ProductDetailDto;

import java.util.Map;

public interface ProductDetailDao {

    ProductDetailDto select(Integer det_id) throws Exception;
    ProductDetailDto selectAll() throws Exception;
    int insert(ProductDetailDto dto) throws Exception;
    int minInsert(ProductDetailDto dto) throws Exception;
    int update(ProductDetailDto dto) throws Exception;

    int delete(ProductDetailDto dto) throws Exception;
    int deleteAll() throws Exception;
}