package com.devkurly.product.service;

import com.devkurly.product.dto.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductService {
    int getCount() throws Exception;

    int remove(Integer pdt_id) throws Exception;

    int write(ProductDto productDto) throws Exception;

    List<ProductDto> getList() throws Exception;

    ProductDto read(Integer pdt_id) throws Exception;

    List<ProductDto> getPage(Map map) throws Exception;

    int modify(ProductDto productDto) throws Exception;
}
