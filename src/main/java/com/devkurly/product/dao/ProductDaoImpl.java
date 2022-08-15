package com.devkurly.product.dao;

import com.devkurly.product.domain.ProductDto;
import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.devkurly.product.dao.ProductMapper.";

    // C
    @Override
    public int insert(ProductDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }


    // R
    @Override
    public List<ProductDto> ProductBestlist(Map map) throws Exception {
        return session.selectList(namespace + "ProductBestlist", map);
    }

    @Override
    public List<ProductDto> ProductNewList(Map map) throws Exception {
        return session.selectList(namespace + "ProductNewList", map);
    }

    @Override
    public List<ProductDto> ProductList(Map map) throws Exception {
        return session.selectList(namespace + "ProductList", map);
    }


    @Override
    public List<ProductDto> ProductThriftylist(Map map) throws Exception {
        return session.selectList(namespace + "ProductThriftylist", map);
    }


    @Override
    public ProductDto select(Integer pdt_id) throws Exception {
        return session.selectOne(namespace + "select", pdt_id);
    }

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }


    // U


    @Override
    public int update(ProductDto dto) throws Exception {
        return session.update(namespace + "update", dto);
    }


    // D
    @Override
    public int deleteAll() {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int delete(Integer pdt_id) throws Exception {
        Map map = new HashMap();
        map.put("pdt_id", pdt_id);
        return session.delete(namespace + "delete", map);
    }

//    @Override
//    public List<ProductDto> ProductListAsc(Map map) {
//        return session.selectList(namespace+"ProductListAsc",map);
//    }

    @Override
    public List<ProductDto> ProductListDESC(Map map) {
        return session.selectList(namespace + "ProductListDESC", map);
    }
}




