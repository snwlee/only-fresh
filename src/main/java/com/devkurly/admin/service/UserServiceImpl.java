package com.devkurly.admin.service;

import com.devkurly.admin.dao.*;
import com.devkurly.admin.domain.*;
import com.devkurly.admin.dao.UserDao;
import com.devkurly.admin.domain.UserDto;
import com.devkurly.admin.service.UserService;
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
    public int write(UserDto userDto) throws Exception {
        return userDao.insert(userDto);
    }

    @Override
    public List<UserDto> getList() throws Exception {
        return userDao.selectAll();
    }

    @Override
    public UserDto read(Integer user_id) throws Exception {
        UserDto userDto = userDao.select(user_id);
        userDao.increaseViewCnt(user_id);

        return userDto;
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