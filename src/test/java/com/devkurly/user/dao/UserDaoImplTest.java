//package com.devkurly.user.dao;
//
//import com.devkurly.user.domain.UserDto;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.Date;
//
//import static org.junit.Assert.*;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
//public class UserDaoImplTest {
//    @Autowired
//    UserDao userDao;

//    @Test
//    public void insertUser() {
//        userDao.deleteAll();
//        assertTrue(userDao.count()==0);
//
//        // 이름,이메일,비번,휴대폰,가입일,성별,생년월일,추천인이메일,약관동의
//        UserDto user = new UserDto("kim", "kim@naver.com", "pwd1234", new Date(), "male", new Date(), "yong@daum.net", 1);
//        assertTrue(userDao.insertUser(user)==1);
//        assertTrue(userDao.count()==1);
//
//        UserDto user2 = userDao.selectUser(user.getUser_id());
//        assertTrue(user.equals(user2));
//
//        UserDto user3 = new UserDto();
//        assertTrue(userDao.insertUser(user3)==1);
//        assertTrue(userDao.count()==2);
//
//        // 같은 데이터를 2번 입력하고 예외가 발생하는지 테스트
//        userDao.insertUser(user);  // java.sql.SQLIntegrityConstraintViolationException예외발생. Duplicate entry 'asdf' for key 'PRIMARY'
//    }
//}