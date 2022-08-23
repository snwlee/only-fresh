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

@Controller
@RequestMapping("/mypage")
public class MyPageController {
    CouponService couponService;

    public MyPageController(CouponService couponService) {
        this.couponService = couponService;
    }

    @GetMapping("")
    public String showMyPageCoupon() {
        return "/mypage/myCoupon/myCoupon";
    }

    @PostMapping("/coupon")
    public ResponseEntity<String> addCouponToUser(HttpServletRequest req , String nm) {
        Integer user_id = ((MemberMainResponseDto) req.getSession().getAttribute("memberResponse")).getUser_id();

        if(user_id == null || nm == ""){
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

    @GetMapping("/coupon")
    public ResponseEntity<List<CouponDto>> bringUserCoupons(HttpSession session) {
        List<CouponDto> list = null;

        Integer user_id = ((MemberMainResponseDto) session.getAttribute("memberResponse")).getUser_id();

        try {
            list = couponService.selectUserCoupons(user_id);
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
