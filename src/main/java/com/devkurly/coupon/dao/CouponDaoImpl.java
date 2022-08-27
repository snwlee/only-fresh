package com.devkurly.coupon.dao;

import com.devkurly.coupon.domain.CouponDto;
import com.devkurly.coupon.domain.UserCouponDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CouponDaoImpl implements CouponDao {
    private SqlSession session;

    public CouponDaoImpl(SqlSession session) {
        this.session = session;
    }

    private static String namespace = "com.devkurly.coupon.dao.CouponMapper.";

    // C
    @Override
    public int create(CouponDto couponDto) throws Exception {
        return session.insert(namespace+"create", couponDto);
    }
    @Override
    public int createWithId(CouponDto couponDto) throws Exception {
        return session.insert(namespace+"createWithId", couponDto);
    }
    @Override
    public int createUserCoupon(UserCouponDto userCouponDto) throws Exception {
        return session.insert(namespace + "createCouponToUser", userCouponDto);
    }

    // R
    @Override
    public CouponDto read(Integer coupn_id) throws Exception {
        return session.selectOne(namespace + "read", coupn_id);
    }
    @Override
    public List<CouponDto> readAll() throws Exception {
        return session.selectList(namespace+"readAll");
    }
    @Override
    public List<CouponDto> readUserCoupons(Integer user_id) throws Exception {
        return session.selectList(namespace+"readUserCoupons", user_id);
    }

    // U
    @Override
    public int update(CouponDto couponDto) throws Exception {
        return session.update(namespace + "update", couponDto);
    }

    // D
    @Override
    public int delete(int coupn_id) throws Exception {
        return session.delete(namespace+"delete", coupn_id);
    }
    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }
    @Override
    public int deleteUserCoupon(Map<String, Integer> map) throws Exception {
        return session.delete(namespace+"deleteUserCoupon", map);
    }
}
