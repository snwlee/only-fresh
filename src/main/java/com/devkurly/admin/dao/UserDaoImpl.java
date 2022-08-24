package com.devkurly.admin.dao;

import com.devkurly.admin.domain.UserDto;
import com.devkurly.admin.domain.UserSearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    SqlSession session;
    String namespace="com.devkurly.admin.dao.UserMapper.";

    @Override
    public UserDto select(int user_id) throws Exception {
        return session.selectOne(namespace+"select", user_id);
    }

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int delete(Integer user_id) throws Exception {
        return session.delete(namespace + "delete", user_id);
    }

    @Override
    public int insert(UserDto dto) throws Exception {
        return session.insert(namespace + "insert", dto);
    }

    @Override
    public List<UserDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public UserDto select(Integer user_id) throws Exception {
        return session.selectOne(namespace + "select", user_id);
    }

    @Override
    public List<UserDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    }

    @Override
    public int update(UserDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    }
    @Override
    public List<UserDto> userSearchSelectPage(UserSearchCondition sc) throws Exception {
        return session.selectList(namespace+"userSearchSelectPage", sc);
    }
    @Override
    public int userSearchResultCnt(UserSearchCondition sc) throws Exception {
        return session.selectOne(namespace+"userSearchResultCnt", sc);
    }


}

