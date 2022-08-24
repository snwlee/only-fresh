package com.devkurly.admin.service;

import com.devkurly.admin.domain.UserDto;
import com.devkurly.admin.domain.UserSearchCondition;

import java.util.List;
import java.util.Map;

public interface UserService {
    int getCount() throws Exception;

    int remove(Integer user_id) throws Exception;

    int insert(UserDto userDto) throws Exception;

    List<UserDto> getList() throws Exception;

    UserDto read(Integer user_id) throws Exception;

    List<UserDto> getPage(Map map) throws Exception;

    int modify(UserDto userDto) throws Exception;

    List<UserDto> getUserSearchResultPage(UserSearchCondition sc) throws Exception;

    int getUserSearchResultCnt(UserSearchCondition sc) throws Exception;

}