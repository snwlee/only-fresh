package com.devkurly.coupon.dao;

import com.devkurly.coupon.domain.CouponDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Transactional
public class CouponDaoImplTest {
    @Autowired
    CouponDao couponDao;

    @Test
    public void isValidTest() throws Exception {

    }

    @Test
    @Transactional
    public void create() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(86, "현대카드 쿠폰", 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        assertTrue(couponDao.create(dto) == 1);
    }

    @Test
    @Transactional
    public void read() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(86, "현대카드 쿠폰", 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        couponDao.create(dto);
        assertTrue(couponDao.readAll().size() == 1);

        CouponDto res = couponDao.readAll().get(0);
        assertTrue(dto.getNm().equals(res.getNm()));
    }

    @Test
    public void readAll() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(86, "현대카드 쿠폰", 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        couponDao.create(dto);
        assertTrue(couponDao.readAll().size() == 1);


        CouponDto dto2 = new CouponDto(86, "신한카드 쿠폰", 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        couponDao.create(dto2);
        assertTrue(couponDao.readAll().size() == 2);
    }

    @Test
    public void update() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(1, 86, "현대카드 쿠폰", 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        int rowCnt = couponDao.createWithId(dto);
        assertTrue(rowCnt == 1);
        assertTrue(couponDao.readAll().size() == 1);

        CouponDto dto2 = new CouponDto(1, 86, "신한카드 쿠폰", 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        assertTrue(couponDao.update(dto2) == 1);

        CouponDto res = couponDao.readAll().get(0);
        assertTrue(res.getNm().equals("신한카드 쿠폰"));
    }


    @Test
    public void delete() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(1, 86, "현대카드 쿠폰", 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        int rowCnt = couponDao.createWithId(dto);
        assertTrue(rowCnt == 1);
        assertTrue(couponDao.readAll().size() == 1);

        rowCnt = couponDao.delete(dto.getCoupn_id());
        assertTrue(rowCnt == 1);
        assertTrue(couponDao.readAll().size() == 0);
    }
}