package com.devkurly.admin.dao;

import com.devkurly.admin.domain.UserDto;
import com.devkurly.admin.domain.UserSearchCondition;

import java.util.List;
import java.util.Map;

public interface UserDao {
    UserDto select(int user_id) throws Exception;

    int count() throws Exception;

    int deleteAll() throws Exception;

    int delete(Integer user_id) throws Exception;

    int insert(UserDto dto) throws Exception;

    List<UserDto> selectAll() throws Exception;

    UserDto select(Integer user_id) throws Exception;

    List<UserDto> selectPage(Map map) throws Exception;

    int update(UserDto dto) throws Exception;

    int userSearchResultCnt(UserSearchCondition sc) throws Exception;

    List<UserDto> userSearchSelectPage(UserSearchCondition sc) throws Exception;


}
