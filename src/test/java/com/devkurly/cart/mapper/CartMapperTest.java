package com.devkurly.cart.mapper;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartProductResponseDto;
import com.devkurly.mapper.CartMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CartMapperTest {

    @Autowired
    CartMapper cartMapper;

    @Test
    @Transactional
    public void 유저장바구니추가() {
        // given
        Cart cart = new Cart(1, 1, 20);

        // when
        cartMapper.insert(cart);

        // then
        Assert.assertSame(20, cart.getPdt_qty());
    }

    @Test
    @Transactional
    public void 유저장바구니보기() {
        // given
        Cart cart = new Cart(1, 1, 20);
        cartMapper.insert(cart);

        // when
        CartProductResponseDto cartProductResponseDto = cartMapper.joinCartProductByCart(cart);

        // then
        Assert.assertEquals(cart.getUser_id(), cartProductResponseDto.getUser_id());
        Assert.assertEquals(cart.getPdt_id(), cartProductResponseDto.getPdt_id());
        Assert.assertEquals(cart.getPdt_qty(), cartProductResponseDto.getPdt_qty());
    }

    @Test
    @Transactional
    public void 유저장바구니수량변경() {
        // given
        Cart cart = new Cart(1, 1, 20);
        cartMapper.insert(cart);
        cart.setPdt_qty(20);

        // when
        cartMapper.update(cart);

        // then
        Assert.assertSame(20, cartMapper.findByCart(cart).getPdt_qty());
    }

    @Test
    @Transactional
    public void 유저장바구니제거() {
        // given
        Cart cart = new Cart(1, 1, 20);
        Integer insert = cartMapper.insert(cart);

        // when
        Integer delete = cartMapper.delete(cart.getUser_id());

        // then
        Assert.assertEquals(insert, delete);
    }

    @Test
    @Transactional
    public void 쿠키장바구니추가() {
        // given
        Cart cart = new Cart();
        cart.setUser_id(123452);
        cart.setPdt_id(1);
        cart.setPdt_qty(20);

        // when
        cartMapper.insert(cart);

        // then
        Assert.assertTrue(123452 == cart.getUser_id());
    }
}