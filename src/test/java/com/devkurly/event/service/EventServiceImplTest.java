package com.devkurly.event.service;

import com.devkurly.event.domain.EventDto;
import com.devkurly.event.domain.EventIdDto;
import com.devkurly.event.service.EventService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class EventServiceImplTest {
    @Autowired
    private EventService eventService;

    //    C
    @Test
    @Transactional
    public void insertTest() throws Exception {
        eventService.removeAll();
        // 1. 정상적인 경우
        EventDto normalTestDto = new EventDto("198zx", "test desc", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", 1, "A001", "19970226", "20220925", 0, 10);
        assertTrue(eventService.insert(normalTestDto) == 1);

        // 2. DB에 넘어가기 전에는 event_id 가 null 이어야 한다.
        EventDto idTestDto = new EventDto(1, "test nm", "test desc", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", 1, "A001", "19970226", "20220925", 0, 10);
        assertTrue(eventService.isValid(idTestDto));

        // 3. nm 의 값이 50자 이상 왔을 때 감지하나
        EventDto nmOverFifty = new EventDto("01234567890123456789012345678901234567890123456789000", "test desc", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", 1, "A001", "19970226", "20220925", 0, 10);
        assertTrue(eventService.isValid(nmOverFifty));

        // 4. des의 값이 200자 넘게 들어왔을 때 감지하나
        EventDto desLength = new EventDto("asdfkj", "sal;kjasdfl;kjasldfkjsal;dfkjasld;fkjaslkdfja;lskdfja;slkdfjlsdkfj;aslkdfjalskdfjasldkfja;lskdfjasldfkjslkdfjlskdfjasldkfjslfkdja;lsdfkja;sldkfjl;asjfd;laksdfjalskdfj;lskdfjlsfdjalskdfjaaslkdfja;sldkj;lsfdkj;lskfdlskdfflkdfjlkdjlksjalskfjlsdkfjlksjdlsdjflkajslfjl", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", 1, "A001", "19970226", "20220925", 0, 10);
        assertTrue(eventService.isValid(desLength));

        // 5. photo 의 값이 1000자 넘게 들어왔을 때
//        EventDto photoLength = new EventDto("012345", "test desc", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", 1, "A001", "19970226", "20220925", 0, 10);
//        assertTrue(eventService.isValid(photoLength).contains("photo over "))

        // 6. photo_alt 의 값이 100 자 넘게 들어왔을 때
        EventDto photoAltLength = new EventDto("asdfasdfkj", "skfdlskdfflkdfjlkdjlksjalskfjlsdkfjlksjdlsdjflkajslfjl", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789", 1, "A001", "19970226", "20220925", 0, 10);
        assertTrue(eventService.isValid(photoAltLength));

        // 7. cat_cd 가 null 인 걸 잡아내느냐
        EventDto catCdNull = new EventDto( "test nm", "test desc", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", null, "A001", "19970226", "20220925", 0, 10);
        assertTrue(eventService.isValid(catCdNull));

        // 8. setl_methd_cd 가 존재하지 않는 코드일 때

        // 9. stpt_dd 가 not null 인데 null 이 넘어오는 경우
        EventDto stptDdNull = new EventDto( "test nm", "test desc", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", 1, "A001", null, "20220925", 0, 10);
        assertTrue(eventService.isValid(stptDdNull));


    }

    //    R
    @Test
    public void getCountTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);

        EventDto eventDto = new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30);
        assertTrue(eventService.insert(eventDto) == 1);

        assertTrue(eventService.getCount() == 1);
    }

    @Test
    public void getEventTest() throws Exception {
        eventService.removeAll();

        EventDto eventDto = new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30);
        assertTrue(eventService.insert(eventDto) == 1);

        Integer event_id = eventService.getEventList().get(0).getEvent_id();
        eventDto.setEvent_id(event_id);
        EventDto eventDto2 = eventService.getEvent(event_id);

        assertTrue(eventDto.equals(eventDto2));
    }

    @Test
    public void getEventListTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);

        eventService.insert(new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 1);

        eventService.insert(new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 2);
    }

    @Test
    public void getEventIdsTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getEventIds().size() == 0);

        eventService.insert(new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 1);

        EventDto eventDto = eventService.getEventList().get(0);
        int eventDto_id = eventDto.getEvent_id();

        EventIdDto eventIdDto = eventService.getEventIds().get(0);
        int eventIdDto_id = eventIdDto.getEvent_id();

        assertTrue(eventDto_id == eventIdDto_id);
    }

    //    U
    @Test
    public void modifyTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);


        eventService.insert(new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 1);
        int event_id = eventService.getEventList().get(0).getEvent_id();

        EventDto eventDto2 = new EventDto("2", "2", "2", "2", 2, "2", "20100226", "20200812", 1, 90);
        eventDto2.setEvent_id(event_id);
        eventService.modify(eventDto2);

        assertTrue(eventService.getEventList().get(0).getNm().equals("2"));
    }

    //new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30)
//    D
    @Test
    public void deleteAllTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);

        eventService.insert(new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 1);

        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);
    }

    @Test
    public void deleteTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);

        EventDto eventDto = new EventDto("1", "1", "1", "1", 1, "1", "19970226", "19960227", 0, 30);
        eventService.insert(eventDto);
        assertTrue(eventService.getCount() == 1);

        Integer event_id = eventService.getEventList().get(0).getEvent_id();
        eventService.remove(event_id);
        assertTrue(eventService.getCount() == 0);
    }
}