package com.devkurly.event.dao;

import com.devkurly.event.domain.EventDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class EventDaoImplTest {
    @Autowired
    private EventDao eventDao;

    @Test
    public void countTest() throws Exception {
        System.out.println("came in");
        assertTrue(eventDao.count() == 1);
    }
}