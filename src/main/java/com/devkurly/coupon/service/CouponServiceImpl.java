package com.devkurly.coupon.service;

import com.devkurly.coupon.dao.CouponDao;
import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.domain.UserCouponDto;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CouponServiceImpl implements CouponService {
    CouponDao couponDao;

    public CouponServiceImpl(CouponDao couponDao) {
        this.couponDao = couponDao;
    }

    // FrontEnd  에서 넘어온 값의 유효성 검사
    public boolean isCouponValid(CouponDto dto) {
        // CouponDto 의 이름(Nm)이 null 값으로 들어옴
//        if(dto.getNm() == null) return false;

        return true;
    }

    // C
    @Override
    public int insert(CouponDto couponDto) throws Exception {
        // 들어온 값이 유효하지 않으면 throw new Exception
        if (!isCouponValid(couponDto)) throw new Exception("" + HttpStatus.BAD_REQUEST);

        try {
            int rowCnt = couponDao.create(couponDto);
            if (rowCnt != 1) throw new Exception("" + HttpStatus.INTERNAL_SERVER_ERROR);
            return rowCnt;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public int insertUserCoupon(Integer user_id, String nm) throws Exception {
        // user_id, nm 에 대한 유효성 검사 해야함
        UserCouponDto dto = new UserCouponDto(user_id, nm );

        try {
            int rowCnt = couponDao.createUserCoupon(dto);
            if( rowCnt != 1) throw new Exception("" + HttpStatus.INTERNAL_SERVER_ERROR);
            return rowCnt;
        } catch(Exception e){
            throw new Exception(e.getMessage());
        }
    }

    // R
    @Override
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

    @Override
    public List<CouponDto> selectAll() throws Exception {
        List<CouponDto> list = couponDao.readAll();

        try {
            return list;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
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
    @Override
    public int update(CouponDto couponDto) throws Exception {
        if (!isCouponValid(couponDto)) throw new Exception("" + HttpStatus.BAD_REQUEST);

        int rowCnt = couponDao.update(couponDto);

        if (rowCnt != 1) throw new Exception("" + HttpStatus.INTERNAL_SERVER_ERROR);

        try {
            return rowCnt;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    // D
    @Override
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

    @Override
    public int deleteAll() throws Exception {
        int rowCnt = couponDao.deleteAll();

        try {
            return rowCnt;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

}
