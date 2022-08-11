package com.devkurly.event.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDaoImpl implements EventDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.devkurly.event.dao.EventMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
}
