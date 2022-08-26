package com.devkurly.coupon.dao;

import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.event.dao.EventDao;
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

    @Autowired
    EventDao eventDao;

    @Test
    public void isValidTest() throws Exception {

    }

    // C
    @Test
    @Transactional
    public void createTest() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(86, "현대카드 쿠폰", 1000000,1, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        assertTrue(couponDao.create(dto) == 1);
    }
    @Test
    @Transactional
    public void createWithIdTest() throws Exception{

    }
    @Test
    @Transactional
    public void createUserCoupon() throws Exception {
        
    }


    // R
    @Test
    @Transactional
    public void readTest() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(86, "현대카드 쿠폰", 1000000,1, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        couponDao.create(dto);
        assertTrue(couponDao.readAll().size() == 1);

        CouponDto res = couponDao.readAll().get(0);
        assertTrue(dto.getNm().equals(res.getNm()));
    }

    @Test
    public void readAllTest() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(86, "현대카드 쿠폰", 1000000,1, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        couponDao.create(dto);
        assertTrue(couponDao.readAll().size() == 1);


        CouponDto dto2 = new CouponDto(86, "신한카드 쿠폰", 1000000, 1, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        couponDao.create(dto2);
        assertTrue(couponDao.readAll().size() == 2);
    }

    @Test
    @Transactional
    public void readUsersCoupons() throws Exception {
    }

    // U
    @Test
    public void updateTest() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(1, 86, "현대카드 쿠폰",1, 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        int rowCnt = couponDao.createWithId(dto);
        assertTrue(rowCnt == 1);
        assertTrue(couponDao.readAll().size() == 1);

        CouponDto dto2 = new CouponDto(1, 86, "신한카드 쿠폰",1, 1000000, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        assertTrue(couponDao.update(dto2) == 1);

        CouponDto res = couponDao.readAll().get(0);
        assertTrue(res.getNm().equals("신한카드 쿠폰"));
    }


    // D
    @Test
    public void deleteTest() throws Exception {
        couponDao.deleteAll();
        assertTrue(couponDao.readAll().size() == 0);

        CouponDto dto = new CouponDto(1, 86, "현대카드 쿠폰", 1000000,1, "내일까지만 가능", "현대카드만", "할인", 30, "20220829");
        int rowCnt = couponDao.createWithId(dto);
        assertTrue(rowCnt == 1);
        assertTrue(couponDao.readAll().size() == 1);

        rowCnt = couponDao.delete(dto.getCoupn_id());
        assertTrue(rowCnt == 1);
        assertTrue(couponDao.readAll().size() == 0);
    }
}