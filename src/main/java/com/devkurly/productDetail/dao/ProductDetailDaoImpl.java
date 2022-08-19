package com.devkurly.productDetail.dao;

import com.devkurly.productDetail.domain.ProductDetailDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class ProductDetailDaoImpl implements ProductDetailDao {

    private SqlSession session;

    public ProductDetailDaoImpl(SqlSession session) {
        this.session = session;
    }

    private static String namespace = "com.devkurly.productDetail.dao.ProductDetailMapper.";

    @Override
    public ProductDetailDto select(Integer det_id) throws Exception {
        return session.selectOne(namespace + "select", det_id);
    }

    @Override
    public int insert(ProductDetailDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public int update(ProductDetailDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }
}
