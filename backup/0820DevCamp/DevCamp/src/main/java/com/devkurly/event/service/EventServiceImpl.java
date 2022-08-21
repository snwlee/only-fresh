package com.devkurly.event.service;

import com.devkurly.event.dao.EventDao;
import com.devkurly.event.domain.EventDto;
import com.devkurly.event.domain.EventIdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {
    EventDao eventDao;

    public EventServiceImpl(EventDao eventDao) {
        this.eventDao = eventDao;
    }


    public boolean isValid(EventDto dto) throws Exception {
        // FrontEnd 에서 잘못된 값이 넘어오는 경우 -> 400
        // event_id 는 AI 인데 값이 담아서 온 경우
//        nm 의 값이 50자 이상 들어왔을 때
//       nm 이 중복되는 값이 들어왔을 때 거르는 경우
//        des 의 값이 200 자 넘게 들어왔을 때
//        photo 의 값이 1000 자 넘게 들어왔을 때
//        photo_alt 의 값이 100 자 넘게 들어왔을 때
//        cat_cd 는 not null 인데 null 이 넘어오는 경우
//        stpt_dd 가 not null 인데 null 이 넘어오는 경우
//        expi_dd 가 not null 인데 null 이 넘어오는 경우
        if(dto.getEvent_id() != null || dto.getNm().length() > 50|| dto.getDes().length() > 200 || dto.getPhoto().length()> 1000 || dto.getPhoto_alt().length()>100 || dto.getCat_cd() == null || dto.getStpt_dd() == null || dto.getExpi_dd() == null){
            return false;
        }



//        cat_cd 가 존재하지 않는 코드일 때
//        setl_methd_cd 가 존재하지 않는 코드일 때
//        stpt_dd 가 expi_dd 보다 미래의 날짜인 경우
//        stpt_dd 의 year, month, day domain 체크
//        expi_dd 가 stpt_dd 보다 과거의 날짜인 경우
//        expi_dd 의 year, month, day domain 체크

        return true;
    }

    //    C
    @Override
    public int insert(EventDto dto) throws Exception {
        // 들어온 값의 유효성 검사
        if(!isValid(dto)) throw new Exception(String.valueOf(HttpStatus.BAD_REQUEST));

        try {
            int res = eventDao.create(dto);
            if (res != 1) throw new Exception("error putting event in DB");
            return res;
        } catch (Exception e) {
            // Controller 의 catch 로 가게 되는 에러
            throw new Exception(e.getMessage());
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
        // cascading delete 가 제대로 되는 지에 대한 검사가 필요하다.
        // event_id 가 1 인 이벤트를 지우면, coupon 테이블에 event_id 가 1 인 얘는 없을 것이다.
        return eventDao.deleteAll();
    }

    @Override
    public int remove(Integer event_id) throws Exception {
        return eventDao.delete(event_id);
    }
}
