package com.devkurly.product.service;

import com.devkurly.product.dao.*;
import com.devkurly.product.domain.ProductDto;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

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
    public int remove(Integer pdt_id) throws Exception {
        return productDao.delete(pdt_id);
    }

    @Override
    public int write(ProductDto productDto) throws Exception {
        return productDao.insert(productDto);
    }

    @Override
    public List<ProductDto> getList() throws Exception {
        return productDao.selectAll();
    }

    @Override
    public ProductDto read(Integer pdt_id) throws Exception {
        ProductDto productDto = productDao.select(pdt_id);

        return productDto;
    }

    @Override
    public List<ProductDto> getPage(Map map) throws Exception { // 상품 리스트
        return productDao.selectPage(map); // 흐름을 자세히 보자.
    }

    @Override
    public int modify(ProductDto productDto) throws Exception {
        return productDao.update(productDto);
    }
}