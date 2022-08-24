package com.devkurly.mypage.controller;

import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.service.CouponService;
import com.devkurly.member.dto.MemberMainResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/mypage")
public class MyPageController {
    CouponService couponService;

    public MyPageController(CouponService couponService) {
        this.couponService = couponService;
    }

    @PostMapping("/coupon")
    public ResponseEntity<String> addCouponToUser(HttpServletRequest req, HttpServletResponse res) {
        if (!isLogined(req.getSession())) {
            try {
                res.sendRedirect("/");
                return null;
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        Integer user_id = ((MemberMainResponseDto) req.getSession().getAttribute("memberResponse")).getUser_id();
        String nm = req.getParameter("nm");

        if(user_id == null || nm.equals("")) return new ResponseEntity<>(HttpStatus.BAD_REQUEST);

        try {
            couponService.insertUserCoupon(user_id, nm);
            return new ResponseEntity<>("add coupon to user success", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(e.toString(), e.getMessage().equals("" + 400) ? HttpStatus.BAD_REQUEST : HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/coupon")
    public ResponseEntity<List<CouponDto>> bringUserCoupons(HttpSession session, HttpServletResponse res) {
        if (!isLogined(session)) {
            try {
                res.sendRedirect("/");
                return null;
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        List<CouponDto> list = null;

        System.out.println("session = " + session.getAttribute("memberResponse"));
        try {
            list = couponService.selectUserCoupons(((MemberMainResponseDto) session.getAttribute("memberResponse")).getUser_id());
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    public boolean isLogined(HttpSession session) {
//        return session.getAttribute("user_id") != null;
        if(session.getAttribute("memberResponse") == null) return false;
        return true;
    }
}
