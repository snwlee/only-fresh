package com.devkurly.address.dao;

import com.devkurly.address.domain.AddressDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class AddressDaoImpl implements AddressDao {

    @Autowired
    private SqlSession session;

    private static String namespace = "com.devkurly.address.dao.AddressMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+ "count");
    }

    @Override
    public int insert(AddressDto addressDto) throws Exception {
        return session.insert(namespace + "insert", addressDto);
    }

    @Override
    public List<AddressDto> listSelect(Integer user_id) throws Exception {
        return session.selectList(namespace + "listSelect", user_id);
    }

    @Override
    public AddressDto updateSelect(Integer addr_id) throws Exception {
        return session.selectOne(namespace + "updateSelect", addr_id);
    }

    @Override
    public int update(AddressDto addressDto) throws Exception {
        return session.update(namespace + "update", addressDto);
    }

    @Override
    public int delete(AddressDto addressDto) throws Exception {
        return session.delete(namespace + "delete", addressDto);
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll" );
    }

    @Override
    public int minInsert(Integer user_id) throws Exception {
        return session.insert(namespace + "minInsert", user_id);
    }

    @Override
    public int chkUpdateF(Integer user_id) throws Exception {
        return session.update(namespace + "chkUpdateF", user_id);
    }

    @Override
    public int chkUpdateT(AddressDto addressDto) throws Exception {
        return session.update(namespace + "chkUpdateT", addressDto);
    }
}