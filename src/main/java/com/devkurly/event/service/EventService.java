package com.devkurly.event.service;

import com.devkurly.event.domain.EventDto;
import com.devkurly.event.domain.EventIdDto;

import java.util.List;

public interface EventService {
//    C
    int insert(EventDto dto) throws Exception;

//    R
    int getCount() throws Exception;
    EventDto getEvent(Integer event_id) throws Exception;
    List<EventDto> getEventList() throws Exception;
    List<EventIdDto> getEventIds() throws Exception;

//    U
    int modify(EventDto eventDto) throws Exception;

//    D
    int removeAll() throws Exception;
    int remove(Integer event_id) throws Exception;
}
