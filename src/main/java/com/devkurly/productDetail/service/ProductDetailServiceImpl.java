package com.devkurly.productDetail.service;

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
    public int insertDetail(ProductDetailDto dto) throws Exception {
        return productDetailDao.insert(dto);
    }
    @Override
    public ProductDetailDto selectDetail(Integer det_id ) throws Exception {
        return productDetailDao.select(det_id);
    }
}
