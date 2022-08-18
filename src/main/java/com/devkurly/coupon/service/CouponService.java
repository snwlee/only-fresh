package com.devkurly.coupon.service;

import com.devkurly.coupon.dao.CouponDao;
import com.devkurly.coupon.domain.CouponDto;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CouponService {
    CouponDao couponDao;

    public CouponService(CouponDao couponDao) {
        this.couponDao = couponDao;
    }

    // FrontEnd  에서 넘어온 값의 유효성 검사
    public boolean isValid(CouponDto dto) throws Exception {
        // CouponDto 의 이름(Nm)이 null 값으로 들어옴
//        if(dto.getNm() == null) return false;

        return true;
    }

    // C
    public int insert(CouponDto couponDto) throws Exception {
        // 들어온 값이 유효하지 않으면 throw new Exception
        if (!isValid(couponDto)) throw new Exception("" + HttpStatus.BAD_REQUEST);

        try {
            int rowCnt = couponDao.create(couponDto);
            if (rowCnt != 1) throw new Exception("" + HttpStatus.INTERNAL_SERVER_ERROR);
            return rowCnt;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    // R
    public CouponDto select(int coupn_id) throws Exception {
        // 들어온 쿠폰 ID 값이 0 이하의 경우를 예외 처리
        if (coupn_id <= 0) throw new Exception("" + HttpStatus.BAD_REQUEST);

        try {
            CouponDto res = couponDao.read(coupn_id);
            return res;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public List<CouponDto> selectAll() throws Exception {
        List<CouponDto> list = couponDao.readAll();

        try {
            return list;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public List<CouponDto> selectUserCoupons(Integer user_id) throws Exception {
        if (user_id <= 0) throw new Exception("" + HttpStatus.BAD_REQUEST);

        List<CouponDto> list = null;

        try {
            list = couponDao.readUserCoupons(user_id);
            return list;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    // U
    public int update(CouponDto couponDto) throws Exception {
        if (!isValid(couponDto)) throw new Exception("" + HttpStatus.BAD_REQUEST);

        int rowCnt = couponDao.update(couponDto);

        if (rowCnt != 1) throw new Exception("" + HttpStatus.INTERNAL_SERVER_ERROR);

        try {
            return rowCnt;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    // D
    public int delete(int coupn_id) throws Exception {
        if (coupn_id <= 0) throw new Exception("" + HttpStatus.BAD_REQUEST);

        int rowCnt = couponDao.delete(coupn_id);

        if (rowCnt != 1) throw new Exception("" + HttpStatus.INTERNAL_SERVER_ERROR);

        try {
            return rowCnt;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    public int deleteAll() throws Exception {
        int rowCnt = couponDao.deleteAll();

        try {
            return rowCnt;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

}
