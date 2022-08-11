package com.devkurly.event.dao;

import com.devkurly.event.domain.EventDto;

public interface EventDao {
    int insert(EventDto eventDto) throws Exception;
    int count() throws Exception;

    int deleteAll() throws Exception;

    int delete(Integer event_id) throws Exception;

    EventDto select(Integer event_id) throws Exception;
}
