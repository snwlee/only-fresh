package com.devkurly.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;

    //회원목록조회
    @Override
    public List<UserDto> getUserList() throws Exception {
        return userDao.userList();
    }

    @Override
    public List<UserDto> UserList() {
        return null;
    }

    //회원등록
    @Override
    public int insertUser(UserDto userDto) {
        return userDao.insertUser(userDto);
    }

    @Override
    public UserDto viewUser() {
        return null;
    }

    //회원정보상세조회
    @Override
    public UserDto viewUser(Integer user_id) throws Exception {
        return userDao.viewUser(user_id);
    }

    @Override
    public void deleteUser(Integer user_id) {

    }

    //회원정보수정
    @Override
    public void updateUser(UserDto userDto) throws Exception {
        userDao.updateUser(userDto);
    }
}
