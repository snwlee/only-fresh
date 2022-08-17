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
    @PostMapping("/")
    public ResponseEntity<String> addEvent(@RequestBody CouponDto couponDto) {
        try {
            service.insert(couponDto);
            return new ResponseEntity<>("Create Event Successful", HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>("BAD REQUEST", HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>("INTERNAL SERVER ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // R
    @GetMapping("/list")
    public ResponseEntity<List<CouponDto>> getEvents() throws Exception{
        List<CouponDto> list = null;

        try {
            list = service.selectAll();
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @GetMapping("/{coupn_id}")
    public ResponseEntity<CouponDto> getEvent(@PathVariable Integer coupn_id) {
        CouponDto res = null;

        try {
            res = service.select(coupn_id);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>(res, HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>(res, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // U
    @PatchMapping("/")
    public ResponseEntity<String> updateEvent(@RequestBody CouponDto couponDto) {

        try {
            int res = service.update(couponDto);
            return new ResponseEntity<>("update Successful", HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>("BAD REQUEST", HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>("INTERNAL SERVER ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // D
    @DeleteMapping("/{coupn_id}")
    public ResponseEntity<String> deleteEvent(@PathVariable Integer coupn_id) {
        try {
            service.delete(coupn_id);
            return new ResponseEntity<>("Delete Successful", HttpStatus.OK);
        } catch (Exception e) {
            if(e.getMessage().equals("" + 400)) return new ResponseEntity<>("BAD REQUEST", HttpStatus.BAD_REQUEST);
            return new ResponseEntity<>("INTERNAL SERVER ERROR", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
