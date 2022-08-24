package com.devkurly.member.service;

import com.devkurly.address.domain.AddressDto;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.global.ErrorCode;
import com.devkurly.mapper.MemberMapper;
import com.devkurly.member.domain.Member;
import com.devkurly.member.dto.*;
import com.devkurly.member.exception.DuplicateMemberException;
import com.devkurly.member.exception.SignInException;
import com.devkurly.order.exception.OrderException;
import com.devkurly.util.EncryptSha256;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberService {

    private final MemberMapper memberMapper;

    public Integer join(MemberSaveRequestDto requestDto) {
        Optional.ofNullable(memberMapper.findByEmail(requestDto.getUser_email()))
                .ifPresent((member -> {
                    throw new DuplicateMemberException("이미 존재하는 회원입니다.", ErrorCode.DUPLICATE_MEMBER_EMAIL);
                }));
        requestDto.setPwd(EncryptSha256.encrypt(requestDto.getPwd()));
        return memberMapper.save(requestDto.toEntity());
    }

    public MemberMainResponseDto signIn(MemberSignInRequestDto requestDto) {
        Member member = Optional.ofNullable(memberMapper.findByEmail(requestDto.getUser_email())).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
        checkEncryptPassword(requestDto.getPwd(), member);
        return new MemberMainResponseDto(member);
    }

    public MemberUpdateResponseDto updatePassword(Integer user_id, String pwd) {
        Member member = Optional.ofNullable(memberMapper.findById(user_id)).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
        checkEncryptPassword(pwd, member);
        return new MemberUpdateResponseDto(member);
    }

    public MemberUpdateResponseDto findUpdateMember(Integer user_id) {
        Member member = getMember(user_id);
        return new MemberUpdateResponseDto(member);
    }

    public MemberUpdateResponseDto modifyMember(MemberUpdateRequestDto updateRequest) {
        Member member = Optional.ofNullable(memberMapper.findByEmail(updateRequest.getUser_email())).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
        updateRequest.setPwd(EncryptSha256.encrypt(updateRequest.getPwd()));
        memberMapper.update(updateRequest.toEntity());
        return new MemberUpdateResponseDto(member);
    }

    public List<CouponDto> findCoupon(Integer user_id) {
        List<CouponDto> couponById = memberMapper.findCouponById(user_id);
        if (couponById.isEmpty()) {
            throw new OrderException("사용 가능한 쿠폰이 없습니다.", ErrorCode.ORDER_ERROR);
        }
        return couponById;
    }

    public AddressDto findAddress(Integer user_id) {
        return memberMapper.findAddressById(user_id);
    }

    private Member getMember(Integer user_id) {
        return Optional.ofNullable(memberMapper.findById(user_id)).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
    }

    private static void checkEncryptPassword(String pwd, Member member) {
        String encryptPassword = EncryptSha256.encrypt(pwd);
        if (!encryptPassword.equals(member.getPwd())) {
            throw new SignInException("틀린 비밀번호 입니다.", ErrorCode.SIGN_IN_FAIL);
        }
    }
}
