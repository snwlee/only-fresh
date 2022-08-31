package com.devkurly.mapper;

import com.devkurly.address.domain.AddressDto;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MemberMapper {

    Integer save(Member member);
    Integer saveAddress(AddressDto addressDto);
    Member findByEmail(String user_email);
    Member findById(Integer user_id);
    List<CouponDto> findCouponById(Integer user_id);
    CouponDto findCouponByCouponId(Integer coupn_id);
    AddressDto findAddressById(Integer user_id);
    Integer update(Member member);
    Integer updatePnt(@Param("user_id") Integer user_id, @Param("pnt") Integer pnt);
    Integer updateCoupon(@Param("user_id") Integer user_id, @Param("coupn_id") Integer coupn_id);
    Integer delete(Integer user_id);

}
