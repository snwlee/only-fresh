package com.devkurly.product.dao;


import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.domain.SearchCondition;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;

import java.time.LocalDate;
import java.util.List;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductDaoImplTest {
    @Autowired
    ProductDao productDao;

    @Test
    public void searchSelectPageTest() throws Exception {
        SearchCondition sc = new SearchCondition(1, 10, "피자", "T");
        List<ProductDto> list = productDao.searchSelectPage(sc);
        System.out.println("list = " + list);

    }

        @Test
        public void searchResultCntTest() throws Exception {
        SearchCondition sc = new SearchCondition(1, 10, "피자", "T");
        int cnt = productDao.searchResultCnt(sc);
            System.out.println("cnt = " + cnt);
            assertTrue(cnt==1);
        }



    @Test
    public void select() throws Exception {
        assertTrue(productDao != null);
        System.out.println("productDao = " + productDao);
        ProductDto productDto = productDao.select(1);
        System.out.println("productDto = " + productDto);
        assertTrue(productDto.getPdt_id().equals(1));
    }


    @Test
    public void insert() throws Exception {
        productDao.deleteAll();
        for (int i = 1; i <= 3; i++) {
   //         ProductDto productDto = new ProductDto(1, "쓰레기같은", "제목", 10000, "사진임", 3000, "서브타이틀", "재고관리", true, 5000, "ㅎㅇ", "ㅎㅇ", false,
   //                 30, "name", "company");
   //         productDao.insert(productDto);
        }
    }
            @Test
            public void delete () throws Exception{
                productDao.deleteAll();
                assertTrue(productDao.count()==0);
            }
       //     @Test
       //     public void productBestList () throws Exception{
       //         productDao.ProductBestList(productDto);
       //     }
       //
       //     @Test
       //     public void productNewList () {
       //     }
       //
       //     @Test
       //     public void productList () {
       //     }
       //
       //     @Test
       //     public void productThriftyList () {
       //     }
       //
       //     @Test
       //     public void count () {
       //     }
       //
       //     @Test
       //     public void update () {
       //     }
       //

       //
       //     @Test
       //     public void delete () {
       //     }
       //
       //     @Test
       //     public void productListDESC () {
            //     }
        }

