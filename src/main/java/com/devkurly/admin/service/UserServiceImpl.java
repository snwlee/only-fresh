package com.devkurly.admin.service;

import com.devkurly.admin.dao.UserDao;
import com.devkurly.admin.domain.UserDto;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    @Override
    public int getCount() throws Exception {
        return userDao.count();
    }

    @Override
    public int remove(Integer user_id) throws Exception {
        return userDao.delete(user_id);
    }

    @Override
    public int insert(UserDto userDto) throws Exception {
        return userDao.insert(userDto);
    }

    @Override
    public List<UserDto> getList() throws Exception {
        return userDao.selectAll();
    }

    //회원정보상세조회
    @Override
    public UserDto read(Integer user_id) throws Exception {
        return userDao.select(user_id);
    }

    @Override
    public List<UserDto> getPage(Map map) throws Exception {
        return userDao.selectPage(map);
    }

    @Override
    public int modify(UserDto userDto) throws Exception {
        return userDao.update(userDto);
    }



}