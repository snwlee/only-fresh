package com.devkurly.event.dao;

import com.devkurly.event.domain.EventDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EventDaoImpl implements EventDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.devkurly.event.dao.EventMapper.";

    //    C
    @Override
    public int insert(EventDto eventDto) throws Exception {
        return session.insert(namespace + "insert", eventDto);
    }

    //    R
    @Override
    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
    @Override
    public EventDto select(Integer event_id) throws Exception {
        return session.selectOne(namespace + "select", event_id);
    }
    @Override
    public List<EventDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

//    U
    @Override
    public int update(EventDto eventDto) throws Exception {
        return session.update(namespace + "update", eventDto);
    }

    //    D
    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }
    @Override
    public int delete(Integer event_id) throws Exception {
        return session.delete(namespace + "delete", event_id);
    }

}
