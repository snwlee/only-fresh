package com.devkurly.admin.dao;

import com.devkurly.admin.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class UserDaoImplTest {
    @Autowired
    UserDao userDao;

    @Test
    public void select() throws Exception{
//        assertTrue(userDao != null);
//        System.out.println("userDao = " + userDao);
//        UserDto userDto = userDao.select(1);
//        System.out.println("userDto = " + userDto);
//        assertTrue(userDto.getUser_id().equals(1));
    }

    @Test
    public void count() {
    }

    @Test
    public void deleteAll() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void insert() {
    }

    @Test
    public void selectAll() {
    }

    @Test
    public void testSelect() {
    }

    @Test
    public void selectPage() {
    }

    @Test
    public void update() {
    }

    @Test
    public void increaseViewCnt() {
    }
}