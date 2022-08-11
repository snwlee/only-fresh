package com.devkurly.product.dao;

import com.devkurly.product.dto.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductDao {
    int count() throws Exception // T selectOne(String statement)
    ;


    int deleteAll(); // int delete(String statement)


    int delete(Integer pdt_id) throws Exception // int delete(String statement, Object parameter)
    ;

    ProductDto select(int pdt_id) throws Exception;

    int insert(ProductDto dto) throws Exception // int insert(String statement, Object parameter)
    ;

    List<ProductDto> selectAll() throws Exception // List<E> selectList(String statement)
    ;

    ProductDto select(Integer pdt_id) throws Exception // T selectOne(String statement, Object parameter)
    ;

    List<ProductDto> selectPage(Map map) throws Exception // List<E> selectList(String statement, Object parameter)
    ;

    int update(ProductDto dto) throws Exception // int update(String statement, Object parameter)
    ;

    int increaseViewCnt(Integer pdt_id) throws Exception // int update(String statement, Object parameter)
    ;
}
