package com.devkurly.productDetail.service;

import com.devkurly.productDetail.domain.ProductDetailDto;

public interface ProductDetailService {

    int insertDetail(ProductDetailDto dto) throws Exception;

    ProductDetailDto selectDetail(Integer det_id) throws Exception;

}
