package com.devkurly.mypage.controller;

import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.service.CouponService;
import com.devkurly.member.dto.MemberMainResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    CouponService couponService;

    public MyPageController(CouponService couponService) {
        this.couponService = couponService;
    }

    // 마이페이지의 쿠폰관리 페이지(/webapp/WEB-INF/views/mypage/myCoupon/myCoupon.jsp)로 라우팅
    @GetMapping("")
    public String showMyPageCoupon() {
        return "/mypage/myCoupon/myCoupon";
    }

    // 마이페이지의 상품문의 페이지(/webapp/WEB-INF/views/mypage/myBoard/inquiry.jsp)로 라우팅.
    @GetMapping("/product_inquiry")
    public String showMyInquiry(){ return "mypage/myBoard/inquiry";}
    // 마이페이지의 상품리뷰 페이지(/webapp/WEB-INF/views/mypage/myBoard/review.jsp)로 라우팅 .
    @GetMapping("/myReview")
    public String showMyReview(){ return "mypage/myBoard/review";}
    // 마이페이지의 찜상품 페이지(/webapp/WEB-INF/views/mypage/myBoard/pick.jsp)로 라우팅.
    @GetMapping("/mypick")
    public String showMypick(){ return "mypage/myBoard/pick";}

    // 현재 로그인한 유저의 아이디 값과 쿠폰의 이름으로, 해당 유저에게 쿠폰 지급
    @PostMapping("/coupon")
    public ResponseEntity<String> addCouponToUser(HttpServletRequest req , String nm) {
        Integer user_id = ((MemberMainResponseDto) req.getSession().getAttribute("memberResponse")).getUser_id();

        if(user_id == null || nm.equals("")){
            return new ResponseEntity<>("" + HttpStatus.BAD_REQUEST, HttpStatus.BAD_REQUEST);
        }

        try {
            couponService.insertUserCoupon(user_id, nm);
            return new ResponseEntity<>("add coupon to user success", HttpStatus.OK);
        } catch (Exception e) {
            String errorMsg = e.getMessage();
            return new ResponseEntity<>(errorMsg, errorMsg.contains("" + 400) || errorMsg.contains("Integrity") ? HttpStatus.BAD_REQUEST : HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 현재 로그인한 유저가 소유한 쿠폰들을 DB에서 불러오기
    @GetMapping("/coupon")
    public ResponseEntity<Map<Boolean, List<CouponDto>>> bringUserCoupons(HttpSession session) {
        Map<Boolean, List<CouponDto>> map = null;

        Integer user_id = ((MemberMainResponseDto) session.getAttribute("memberResponse")).getUser_id();

        try {
            List<CouponDto>  list = couponService.selectUserCoupons(user_id);
            map = list.stream().collect(Collectors.groupingBy(CouponDto::getUsed));
            return new ResponseEntity<>(map, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(map, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
