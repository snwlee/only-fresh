package com.devkurly.coupon.controller;

import com.devkurly.coupon.dao.CouponDao;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.service.CouponService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/coupon")
public class CouponController {
    CouponService service;
    public CouponController(CouponService service) {
        this.service = service;
    }

    // C
    // 관리자가 쿠폰 추가하기
    @PostMapping("/")
    public ResponseEntity<String> addCoupon(@RequestBody CouponDto couponDto) {
        try {
            service.insert(couponDto);
            return new ResponseEntity<>("Create Event Successful", HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>("BAD REQUEST", HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>("INTERNAL SERVER ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // R
    // 쿠폰의 목록 보기
    @GetMapping("/list")
    public ResponseEntity<List<CouponDto>> getCoupons() throws Exception{
        List<CouponDto> list = null;

        try {
            list = service.selectAll();
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 쿠폰의 id를 통해 쿠폰 조회하기
    @GetMapping("/{coupn_id}")
    public ResponseEntity<CouponDto> getCoupon(@PathVariable Integer coupn_id) {
        CouponDto res = null;

        try {
            res = service.select(coupn_id);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>(res, HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>(res, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 특정 유저가 소지한 쿠폰의 목록 조회하기
    @GetMapping("/user/{user_id}")
    public ResponseEntity<List<CouponDto>> getUserCoupons(@PathVariable Integer user_id){
        List<CouponDto> list = null;

        try {
            list = service.selectUserCoupons(user_id);
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // U
    // 특정 쿠폰 수정하기
    @PatchMapping("/{coupn_id}")
    public ResponseEntity<String> updateCoupon(@RequestBody CouponDto couponDto) {

        try {
            int res = service.update(couponDto);
            return new ResponseEntity<>("update Successful", HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>("BAD REQUEST", HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>("INTERNAL SERVER ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // D
    // 특정 쿠폰 삭제하기
    @DeleteMapping("/{coupn_id}")
    public ResponseEntity<String> deleteCoupon(@PathVariable Integer coupn_id) {
        try {
            service.delete(coupn_id);
            return new ResponseEntity<>("Delete Successful", HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>("BAD REQUEST", HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>("INTERNAL SERVER ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
