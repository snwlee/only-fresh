package com.devkurly.product.dao;

import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.domain.SearchCondition;
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
    public int create(ProductDto dto) throws Exception {
        return session.insert(namespace + "create", dto);
    }


    // R
    @Override
    public List<ProductDto> ProductBestList(Map map) throws Exception {
        return session.selectList(namespace + "ProductBestList", map);
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
    public List<ProductDto> ProductThriftyList(Map map) throws Exception {
        return session.selectList(namespace + "ProductThriftyList", map);
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

    public List<ProductDto> mainlist(String cd_type_id)throws Exception {
        return session.selectList(namespace + "mainlist", cd_type_id);
    }



    @Override
    public List<ProductDto> ProductListDESC(Map map) {
        return session.selectList(namespace + "ProductListDESC", map);
    }

    @Override
    public List<ProductDto> selectProductId() throws Exception{ //board용 남겨주세요.
        return session.selectList(namespace + "selectProductId");
    }

    @Override
    public List<ProductDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectPage", sc);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "searchResultCnt", sc);
    }

    @Override
    public List<ProductDto> EventList(Map map) throws Exception {
        return session.selectList(namespace+"EventList", map);
    }

    @Override
    public List<ProductDto> CateList(Map map) throws Exception {
        return session.selectList(namespace+"CateList",map);
    }

    @Override
    public List<ProductDto> Vegetable(Map map) throws Exception {
        return session.selectList(namespace+"Vegetable",map);
    }

    @Override
    public List<ProductDto> EcoVegetable(Map map) throws Exception {
        return session.selectList(namespace+"EcoVegetable",map);
    }

    @Override
    public List<ProductDto> main(Map map) throws Exception {
        return session.selectList(namespace+"main",map);
    }

    @Override
    public List<ProductDto> goodslist(String cd_name) throws Exception {
        return session.selectList(namespace+"goodslist",cd_name);
    }

}




