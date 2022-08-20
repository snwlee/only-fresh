package com.devkurly.admin;

import java.util.List;

public interface UserService {
    //회원목록조회
    List<UserDto> getUserList() throws Exception;

    public List<UserDto> UserList();
    public int insertUser(UserDto userDto);
    public UserDto viewUser();

    UserDto viewUser(Integer user_id) throws Exception;

    public void deleteUser(Integer user_id);
    public void updateUser(UserDto userDto) throws Exception;
}
