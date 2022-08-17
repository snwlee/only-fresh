package com.devkurly.event.service;

import com.devkurly.event.dao.EventDao;
import com.devkurly.event.domain.EventDto;
import com.devkurly.event.domain.EventIdDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {
    // 생성자 주입으로 바꿔라
    EventDao eventDao;

    public EventServiceImpl(EventDao eventDao) {
        this.eventDao = eventDao;
    }


    public String isValid(EventDto dto) {
        // stringBuffer 비효율적 아님?
        StringBuffer sb = new StringBuffer("invalid field : ");
//        event_id 는 AI 인데 값이 담아서 온 경우
        if(dto.getEvent_id() != null)
            sb.append("event_id initialized "); // append 왜 2번 씀 구데기
//        nm 의 값이 50자 이상 들어왔을 때
        if(dto.getNm().length() > 50){
            sb.append("nm length over 50 ");
        }
//       nm 이 중복되는 값이 들어왔을 때 거르는 경우

//        des 의 값이 200 자 넘게 들어왔을 때
        if(dto.getDes().length() > 200)
            sb.append("des length over 200 ");
//        photo 의 값이 1000 자 넘게 들어왔을 때
        if(dto.getPhoto().length()> 1000)
            sb.append("photo length over 1000 ");
//        photo_alt 의 값이 100 자 넘게 들어왔을 때
        if(dto.getPhoto_alt().length()>100)
            sb.append("photo_alt length over 100 ");
//        cat_cd 는 not null 인데 null 이 넘어오는 경우
        if(dto.getCat_cd() == null)
            sb.append("cat_cd is null ");
//        cat_cd 가 존재하지 않는 코드일 때

//        setl_methd_cd 가 존재하지 않는 코드일 때

//        stpt_dd 가 not null 인데 null 이 넘어오는 경우
        if(dto.getStpt_dd() == null)
            sb.append("stpt_dd is null ");

//        stpt_dd 가 expi_dd 보다 미래의 날짜인 경우

//        stpt_dd 의 year, month, day domain 체크

//        expi_dd 가 not null 인데 null 이 넘어오는 경우
        if(dto.getExpi_dd() == null)
            sb.append("expi_dd is null ");

//        expi_dd 가 stpt_dd 보다 과거의 날짜인 경우

//        expi_dd 의 year, month, day domain 체크

        return sb.toString();
    }

    //    C
    @Override
    public int insert(EventDto dto) throws Exception {
        // 들어온 값의 유효성 검사
        String isValidRes = isValid(dto);

        if(!isValidRes.equals("invalid field : ")) {
            throw new Exception(isValidRes);
        }
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
