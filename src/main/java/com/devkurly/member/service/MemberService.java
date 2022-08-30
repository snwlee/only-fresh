package com.devkurly.member.service;

import com.devkurly.address.domain.AddressDto;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.global.ErrorCode;
import com.devkurly.mapper.MemberMapper;
import com.devkurly.member.domain.Member;
import com.devkurly.member.dto.*;
import com.devkurly.member.exception.DuplicateMemberException;
import com.devkurly.member.exception.SignInException;
import com.devkurly.order.exception.AddressException;
import com.devkurly.order.exception.OrderException;
import com.devkurly.util.EncryptSha256;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.RequiredArgsConstructor;
import org.checkerframework.checker.units.qual.A;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
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

    public MemberMainResponseDto findUserId(MemberSignInRequestDto requestDto) {
        Member member = Optional.ofNullable(memberMapper.findByEmail(requestDto.getUser_email())).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
        return new MemberMainResponseDto(member);
    }

    public MemberMainResponseDto kakaoSignIn(String user_email) {
        Member member = Optional.ofNullable(memberMapper.findByEmail(user_email)).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
        return new MemberMainResponseDto(member);
    }

    public MemberUpdateResponseDto updatePassword(Integer user_id, String pwd) {
        Member member = Optional.ofNullable(memberMapper.findById(user_id)).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
        checkEncryptPassword(pwd, member);
        return new MemberUpdateResponseDto(member);
    }

    public MemberUpdateResponseDto findUpdateMember(Integer user_id) {
        Member member = findMemberById(user_id);
        return new MemberUpdateResponseDto(member);
    }

    public MemberUpdateResponseDto modifyMember(MemberUpdateRequestDto updateRequest) {
        Member member = Optional.ofNullable(memberMapper.findByEmail(updateRequest.getUser_email())).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
        updateRequest.setPwd(EncryptSha256.encrypt(updateRequest.getPwd()));
        memberMapper.update(updateRequest.toEntity());
        return new MemberUpdateResponseDto(member);
    }

    public Integer updateMemberPnt(Integer user_id, Integer pnt, Integer coupn_id) {
        return memberMapper.updatePnt(user_id, pnt, coupn_id);
    }

    public List<CouponDto> findCoupon(Integer user_id) {
        List<CouponDto> couponById = memberMapper.findCouponById(user_id);
        if (couponById.isEmpty()) {
            throw new OrderException("사용 가능한 쿠폰이 없습니다.", ErrorCode.ORDER_ERROR);
        }
        return couponById;
    }

    public CouponDto findCouponByCouponId(Integer coupn_id) {
        return memberMapper.findCouponByCouponId(coupn_id);
    }

    public AddressDto findAddress(Integer user_id) {
        return Optional.ofNullable(memberMapper.findAddressById(user_id)).orElseThrow(() -> new AddressException("배송지 등록이 필요 합니다.", ErrorCode.NO_ADDRESS_ERROR));
    }

    public Member findMemberById(Integer user_id) {
        return Optional.ofNullable(memberMapper.findById(user_id)).orElseThrow(() -> new SignInException("존재하지 않는 회원 입니다.", ErrorCode.SIGN_IN_FAIL));
    }

    public String getAccessToken(String authorize_code) {
        String access_token = "";
        String refresh_token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=7ab07adcdacec7c4752add19a162ee1b");
            sb.append("&redirect_uri=http://localhost:8080/members/kakao");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();


            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_token;
    }

    public HashMap<String, Object> getUserInfo(String access_Token) {

        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            long id = element.getAsJsonObject().get("id").getAsLong();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
//            String age = kakao_account.getAsJsonObject().get("age_range").getAsString();
            String gender = kakao_account.getAsJsonObject().get("gender").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
//            userInfo.put("age", age);
            userInfo.put("id", id);
            userInfo.put("gender", gender);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return userInfo;
    }

    public Integer saveDefaultAddress(AddressDto addressDto) {
        return memberMapper.saveAddress(addressDto);
    }

    private static void checkEncryptPassword(String pwd, Member member) {
        String encryptPassword = EncryptSha256.encrypt(pwd);
        if (!encryptPassword.equals(member.getPwd())) {
            throw new SignInException("틀린 비밀번호 입니다.", ErrorCode.SIGN_IN_FAIL);
        }
    }
}
