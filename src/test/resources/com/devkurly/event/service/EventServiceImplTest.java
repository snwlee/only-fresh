package com.devkurly.event.service;

import com.devkurly.event.domain.EventDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class EventServiceImplTest {
    @Autowired
    private EventService eventService;

    //    C
    @Test
    public void insertTest() throws Exception {
        EventDto testDto = new EventDto("test nm", "test desc", "product-image.kurly.com/cdn-cgi/image/format=auto/banner/event/8622ba29-6cbf-438e-8865-880838ec3d7a.jpg", "test alt", "test mft", "A001", "19970226", "20220925", 0, 10);

        assertTrue(eventService.insert(testDto) == 1);
    }

    //    R
    @Test
    public void getCountTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);

        EventDto eventDto = new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30);
        assertTrue(eventService.insert(eventDto) == 1);

        assertTrue(eventService.getCount() == 1);
    }

    @Test
    public void getEventTest() throws Exception {
        eventService.removeAll();

        EventDto eventDto = new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30);
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

        eventService.insert(new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 1);

        eventService.insert(new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 2);
    }

//    U
    @Test
    public void modifyTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);


        eventService.insert(new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 1);
        int event_id = eventService.getEventList().get(0).getEvent_id();

        EventDto eventDto2 = new EventDto("2", "2", "2", "2", "2", "2", "20100226", "20200812", 1, 90);
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

        eventService.insert(new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30));
        assertTrue(eventService.getCount() == 1);

        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);
    }

    @Test
    public void deleteTest() throws Exception {
        eventService.removeAll();
        assertTrue(eventService.getCount() == 0);

        EventDto eventDto = new EventDto("1", "1", "1", "1", "1", "1", "19970226", "19960227", 0, 30);
        eventService.insert(eventDto);
        assertTrue(eventService.getCount() == 1);

        Integer event_id = eventService.getEventList().get(0).getEvent_id();
        eventService.remove(event_id);
        assertTrue(eventService.getCount() == 0);
    }
}