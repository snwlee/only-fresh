package com.devkurly.admin;

import java.util.List;

public interface UserDao {
    public List<UserDto> userList() throws Exception;
    public int insert(UserDto userDto) throws Exception;

    //회원등록
    int insertUser(UserDto userDto);

    public UserDto viewUser(Integer user_id) throws Exception;
    public void deleteUser(Integer user_id) throws Exception;
    public void updateUser(UserDto userDto) throws Exception;
}
