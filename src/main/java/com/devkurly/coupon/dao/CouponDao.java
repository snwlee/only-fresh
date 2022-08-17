package com.devkurly.coupon.dao;

import com.devkurly.coupon.domain.CouponDto;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface CouponDao {
    // C
    int create(CouponDto couponDto) throws Exception;
    int createWithId(CouponDto couponDto) throws Exception;

    // R
    CouponDto read(int coupn_id) throws Exception;

    List<CouponDto> readAll() throws Exception;

    // U
    int update(CouponDto couponDto) throws Exception;

    // D
    int delete(int coupn_id) throws Exception;

    int deleteAll() throws Exception;
}
