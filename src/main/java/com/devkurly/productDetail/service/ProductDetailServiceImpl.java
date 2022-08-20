package com.devkurly.productDetail.service;

import com.devkurly.product.dao.ProductDao;
import com.devkurly.productDetail.dao.ProductDetailDao;
import com.devkurly.productDetail.domain.ProductDetailDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProductDetailServiceImpl implements ProductDetailService {

    private ProductDetailDao productDetailDao;

    public ProductDetailServiceImpl(ProductDetailDao productDetailDao) {
        this.productDetailDao = productDetailDao;
    }

    @Override
    public int insert(ProductDetailDto productDetailDto) throws Exception {
        return productDetailDao.insert(productDetailDto);
    }
    @Override
    public ProductDetailDto selectDetail(Integer pdt_id) throws Exception {
        return productDetailDao.select(pdt_id);
    }
    @Override
    public int updateDetail(ProductDetailDto productDetailDto)throws Exception {
        return productDetailDao.update(productDetailDto);
    }
}
