package com.devkurly.event.service;

import com.devkurly.event.dao.EventDao;
import com.devkurly.event.domain.EventDto;
import com.devkurly.event.domain.EventIdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {
    @Autowired
    EventDao eventDao;

    //    C
    @Override
    public int insert(EventDto dto) throws Exception {
        try {
            int res = eventDao.insert(dto);
            if (res != 1) throw new Exception("error putting event in DB");
            return res;
        } catch (Exception e) {
            // Controller 의 catch 로 가게 되는 에러
            throw new Exception("error occured");
        }
    }

    //    R
    @Override
    public int getCount() throws Exception {
        return eventDao.count();
    }

    @Override
    public EventDto getEvent(Integer event_id) throws Exception {
        return eventDao.select(event_id);
    }

    @Override
    public List<EventDto> getEventList() throws Exception {
        return eventDao.selectAll();
    }

    public List<EventIdDto> getEventIds() throws Exception {
        return eventDao.selectIds();
    }

    //    U
    @Override
    public int modify(EventDto eventDto) throws Exception {
        return eventDao.update(eventDto);
    }

    //    D
    @Override
    public int removeAll() throws Exception {
        return eventDao.deleteAll();
    }

    @Override
    public int remove(Integer event_id) throws Exception {
        return eventDao.delete(event_id);
    }
}
