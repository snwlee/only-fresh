package com.devkurly.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession sqlSession;

    //회원목록조회
    @Override
    public List<UserDto> userList() {
        return sqlSession.selectList("user.userList");
    }

    @Override
    public int insert(UserDto userDto) throws Exception {
      return sqlSession.insert("user.userInsert");
    }

    //회원등록
    @Override
    public int insertUser(UserDto userDto) {
        sqlSession.insert("user.insertUser", userDto);
        return 0;
    }

    //회원정보상세조회
    @Override
    public UserDto viewUser(Integer user_id) {
        return sqlSession.selectOne("user.viewUser", user_id);
    }

    @Override
    public void deleteUser(Integer user_id) {

    }

    //회원정보수정
    @Override
    public void updateUser(UserDto userDto) {
        sqlSession.update("user.updateUser", userDto);

    }
}
