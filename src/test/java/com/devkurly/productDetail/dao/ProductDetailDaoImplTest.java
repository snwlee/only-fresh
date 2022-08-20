package com.devkurly.productDetail.dao;

import com.devkurly.productDetail.domain.ProductDetailDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductDetailDaoImplTest {
    @Autowired
    ProductDetailDao productDetailDao;
    @Test
    public void select() throws Exception{
        ProductDetailDto productDetailDto = productDetailDao.select(29);
        System.out.println("productDetailDto = " + productDetailDto);
    }

    @Test
    public void insert() {
    }

    @Test
    public void update() {
    }
}