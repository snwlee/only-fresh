package com.devkurly.event.service;

import com.devkurly.event.domain.EventDto;

public interface EventService {
    int insert(EventDto dto) throws Exception;
    int getCount() throws Exception;
}
