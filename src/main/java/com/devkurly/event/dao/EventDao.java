package com.devkurly.event.dao;

import com.devkurly.event.domain.EventDto;

import java.util.List;

public interface EventDao {
//    C
    int insert(EventDto eventDto) throws Exception;

//    R
    int count() throws Exception;
    EventDto select(Integer event_id) throws Exception;
    List<EventDto> selectAll() throws Exception;

//    U

//    D
    int deleteAll() throws Exception;
    int delete(Integer event_id) throws Exception;

}
