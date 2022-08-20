package com.devkurly.productDetail.service;

import com.devkurly.productDetail.domain.ProductDetailDto;

public interface ProductDetailService {

    int insert(ProductDetailDto dto) throws Exception;

    ProductDetailDto selectDetail(Integer pdt_id) throws Exception;
    int updateDetail(ProductDetailDto productDetailDto)throws Exception;
}
