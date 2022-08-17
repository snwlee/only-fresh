package com.devkurly.product.service;

import com.devkurly.board.domain.BoardDto;
import com.devkurly.product.dao.*;
import com.devkurly.product.domain.ProductDto;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductDao productDao;

    @Override
    public int getCount() throws Exception {
        return productDao.count();
    }



    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer pdt_id) throws Exception {
        productDao.delete(productDao.delete(pdt_id));
        int list = productDao.delete(pdt_id);
        return productDao.delete(pdt_id);
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(ProductDto productDto) throws Exception {
        productDao.insert(productDto);
        int list = productDao.insert(productDto);
        return productDao.insert(productDto);
    }


    @Override
    public ProductDto read(Integer pdt_id) throws Exception {
        ProductDto productDto = productDao.select(pdt_id);

        return productDto;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public int modify(ProductDto productDto) throws Exception {
        productDao.update(productDto);
        int list = productDao.update(productDto);
        return productDao.update(productDto);
    }


    @Override
    public List<ProductDto> ProductList(Map map) throws Exception { // 상품 리스트
        return productDao.ProductList(map);
    }

    @Override
    public List<ProductDto> ProductThriftyList(Map map) throws Exception { // 알뜰상품
        return productDao.ProductThriftyList(map);
    }

    @Override
    public List<ProductDto> ProductBestList(Map map) throws Exception { // 베스트 상품
        return productDao.ProductBestList(map); // 흐름을 자세히 보자.
    }

    @Override
    public List<ProductDto> ProductNewList(Map map) throws Exception { // 신상품
        return productDao.ProductNewList(map);
    }

    @Override
    public List<ProductDto> ProductListDESC(Map map) {
        return productDao.ProductListDESC(map);
    }
}

