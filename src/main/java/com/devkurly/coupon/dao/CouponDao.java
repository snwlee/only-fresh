package com.devkurly.coupon.dao;

import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.domain.UserCouponDto;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface CouponDao {
    // C
    int create(CouponDto couponDto) throws Exception;
    int createWithId(CouponDto couponDto) throws Exception;
    int createUserCoupon(UserCouponDto userCouponDto) throws Exception;

    // R
    CouponDto read(Integer coupn_id) throws Exception;
    List<CouponDto> readAll() throws Exception;
    List<CouponDto> readUserCoupons(Integer user_id) throws Exception;

    // U
    int update(CouponDto couponDto) throws Exception;

    // D
    int delete(int coupn_id) throws Exception;
    int deleteAll() throws Exception;
    int deleteUserCoupon(Map<String, Integer> map) throws Exception;
}
