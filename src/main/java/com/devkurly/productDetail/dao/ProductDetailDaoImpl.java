package com.devkurly.productDetail.dao;

import com.devkurly.productDetail.domain.ProductDetailDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class ProductDetailDaoImpl implements ProductDetailDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.devkurly.productDetailMapper.";

    @Override
    public ProductDetailDto select(Integer det_id) throws Exception {
        return session.selectOne(namespace + "select", det_id);
    }

    @Override
    public ProductDetailDto selectAll() throws Exception {
        return session.selectOne(namespace + "selectAll");
    }

    @Override
    public int insert(ProductDetailDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public int minInsert(ProductDetailDto dto) throws Exception {
        return session.insert(namespace + "minInsert", dto);
    }

    @Override
    public int update(ProductDetailDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }

    @Override
    public int delete(ProductDetailDto dto ) throws Exception {
        return session.delete(namespace + "delete", dto);
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }


}
