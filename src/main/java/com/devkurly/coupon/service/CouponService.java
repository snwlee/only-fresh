package com.devkurly.coupon.service;

import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.domain.UserCouponDto;

import java.util.List;

public interface CouponService {
    // C
    int insert(CouponDto couponDto) throws Exception;

    int insertUserCoupon(UserCouponDto userCouponDto) throws Exception;

    // R
    CouponDto select(int coupn_id) throws Exception;

    List<CouponDto> selectAll() throws Exception;

    List<CouponDto> selectUserCoupons(Integer user_id) throws Exception;

    // U
    int update(CouponDto couponDto) throws Exception;

    // D
    int delete(int coupn_id) throws Exception;

    int deleteAll() throws Exception;
}
