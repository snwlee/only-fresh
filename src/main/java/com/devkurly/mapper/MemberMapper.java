package com.devkurly.mapper;

import com.devkurly.address.domain.AddressDto;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.member.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {

    Integer save(Member member);
    Member findByEmail(String user_email);
    Member findById(Integer user_id);
    List<CouponDto> findCouponById(Integer user_id);
    CouponDto findCouponByCouponId(Integer coupn_id);
    AddressDto findAddressById(Integer user_id);
    Integer update(Member member);
    Integer delete(Integer user_id);

}
