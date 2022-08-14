package com.devkurly.productDetail.service;

import com.devkurly.productDetail.domain.ProductDetailDto;

public interface ProductDetailService {

    int insertDetail(ProductDetailDto dto) throws Exception;

    int minInsertDetail(ProductDetailDto dto) throws Exception;

    int deleteDetail(ProductDetailDto dto) throws Exception;

    int deleteAllDetail() throws Exception;

    ProductDetailDto selectDetail(Integer det_id) throws Exception;

    ProductDetailDto selectAllDetail() throws Exception;
}
