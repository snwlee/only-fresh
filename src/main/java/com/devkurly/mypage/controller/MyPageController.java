package com.devkurly.mypage.controller;

import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.domain.UserCouponDto;
import com.devkurly.coupon.service.CouponService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/mypage")
public class MyPageController {
    CouponService couponService;

    public MyPageController(CouponService couponService) {
        this.couponService = couponService;
    }

    @PostMapping("/coupon")
    public ResponseEntity<String> addCouponToUser(@RequestBody UserCouponDto userCouponDto) {
        try {
            couponService.insertUserCoupon(userCouponDto);
            return new ResponseEntity<>("add coupon to user success", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), e.getMessage().equals("" + 400) ? HttpStatus.BAD_REQUEST : HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/coupon")
    public ResponseEntity<List<CouponDto>> bringUserCoupons(HttpSession session, HttpServletResponse res) {
        if (isLogined(session)) {
            try {
                res.sendRedirect("/");
                return null;
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        List<CouponDto> list = null;

        try {
            list = couponService.selectUserCoupons((Integer) session.getAttribute("user_id"));
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(list, e.getMessage().equals("" + 400) ? HttpStatus.BAD_REQUEST : HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public boolean isLogined(HttpSession session) {
        return session.getAttribute("user_id") != null;
    }
}
