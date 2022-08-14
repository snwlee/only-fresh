package com.devkurly.product.dao;


import com.devkurly.product.domain.ProductDto;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductDaoImplTest {
    @Autowired
    ProductDao  productDao;
    
    @Test
    public void select() throws Exception{
        assertTrue(productDao != null);
        System.out.println("productDao = " + productDao);
        ProductDto productDto = productDao.select(1);
        System.out.println("productDto = " + productDto);
        assertTrue(productDto.getPdt_id().equals(1));
    }



    @Test
    public void insertTestData() throws Exception {
        productDao.deleteAll();
        for(int i = 1; i <= 200; i++) {
            ProductDto productDto = new ProductDto(1,"ab","dd",3000,2000,"da","gg","gf",true);
            productDao.insert(productDto);
        }
    }
}