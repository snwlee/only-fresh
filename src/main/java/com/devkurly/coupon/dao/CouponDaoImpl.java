package com.devkurly.coupon.dao;

import com.devkurly.coupon.domain.CouponDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    // R
    @Override
    public CouponDto read(int coupn_id) throws Exception {
        return session.selectOne(namespace + "read", coupn_id);
    }
    @Override
    public List<CouponDto> readAll() throws Exception {
        return session.selectList(namespace+"readAll");
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
}
