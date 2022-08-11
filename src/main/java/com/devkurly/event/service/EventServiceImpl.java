package com.devkurly.event.service;

import com.devkurly.event.dao.EventDao;
import com.devkurly.event.domain.EventDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements  EventService {
    @Autowired
    EventDao eventDao;

    @Override
    public int insert(EventDto dto) throws Exception {
        return eventDao.insert(dto);
    }
    @Override
    public int getCount() throws Exception {
        return eventDao.count();
    }


}
