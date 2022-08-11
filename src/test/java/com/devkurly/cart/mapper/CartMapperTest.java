package com.devkurly.cart.mapper;

import com.devkurly.cart.domain.Cart;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class CartMapperTest {

    @Autowired
    CartMapper CartMapper;

    @Test
    public void xmlAppContext() {
        ApplicationContext ac = new GenericXmlApplicationContext("1root-context.xml");
        CartMapper mapper = ac.getBean("CartMapper", CartMapper.class);
        org.springframework.util.Assert.isInstanceOf(CartMapper.class, mapper);
    }

    @Test
    public void insert() {
        // given
        Cart cart = new Cart();
        cart.setUser_id(1);
        cart.setPdt_id(1);
        cart.setPdt_qty(20);
        cart.setIn_user("1");
        cart.setUp_user("1");

        // when
        CartMapper.insert(cart);

        // then
        Assert.assertSame(1,cart.getUser_id());
    }

    @Test
    public void findById() {
    }

    @Test
    public void update() {
    }

    @Test
    public void delete() {
    }
}