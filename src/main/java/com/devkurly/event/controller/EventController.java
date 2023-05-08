package com.devkurly.event.controller;

import com.devkurly.event.domain.EventDto;
import com.devkurly.event.domain.EventIdDto;
import com.devkurly.event.service.EventService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/event")
public class EventController {
    EventService service;

    public EventController(EventService service) {
        this.service = service;
    }

    // event 관리자 페이지(/webapp/WEB-INF/views/event/admin.jsp)로 라우팅
    @RequestMapping("/admin")
    public String admin() {
        return "/event/admin";
    }

    // event 메인 페이지(/webapp/WEB-INF/views/event/event.jsp)로 라우팅
    @RequestMapping("/main")
    public String main() {
        return "/event/event";
    }

    //    C
    // FrontEnd 에서 각각의 input tag 의 name 속성이 eventDto 로 mapping 되서 넘어온다.
    @PostMapping(value = "/add")
    public ResponseEntity<String> add(@RequestBody EventDto eventDto) {
        try {
//            1. service 에서 이렇게 에러 핸들링 하는 거다. 이게 service 의 방식
//            if (service.insert(eventDto) != 1) throw new Exception("Write failed");

//            2. 예외 되던지기로, 알아서 catch block 으로 가게 된다. 이게 더 나은 코드이다. 이게 Controller 의 방식
            service.insert(eventDto);

            return new ResponseEntity<>("Success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // 1. httpstatus 종류 나눠야 함
            if (e.getMessage().contains("invalid field"))
                return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);

            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //    R
    // 현재 진행중인 event 의 개수 counting
    @GetMapping("/count")
    public ResponseEntity<Integer> getEventCount() {
        int counts;

        try {
            counts = service.getCount();
            return new ResponseEntity<>(counts, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 현재 진행중인 event 목록 나열
    @GetMapping("/list")
    public ResponseEntity<List<EventDto>> getEvents() {
        List<EventDto> event_list = null;

        try {
            event_list = service.getEventList();
            return new ResponseEntity<>(event_list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(event_list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // DB 에 존재하는 id 들의 번호들 불러오기
    // 사용처 : select tag 에 먼저 이벤트 id 목록 불러오기
    @GetMapping("/id_list")
    public ResponseEntity<List<EventIdDto>> getEventIds() {
        List<EventIdDto> id_list = null;

        try {
            id_list = service.getEventIds();
            return new ResponseEntity<>(id_list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(id_list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // event_id 를 통해 특정 event 읽기
    @GetMapping("/{event_id}")
    public ResponseEntity<EventDto> getEvent(@PathVariable Integer event_id) {
        EventDto res = null;

        try {
            res = service.getEvent(event_id);
            return new ResponseEntity<>(res, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(res, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //    U
    // event_id 를 통해 특정 event 수정
    @PatchMapping("/{event_id}")
    public ResponseEntity<String> modify(@RequestBody EventDto eventDto) {
        System.out.println(eventDto);
        try {
            service.modify(eventDto);
            return new ResponseEntity<>("Modify Successful", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Modify Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    //    D
    // event_id 를 통해 특정 event 삭제
    @DeleteMapping("/{event_id}")
    public ResponseEntity<String> deleteEvent(@PathVariable Integer event_id) {
        try {
            int rowCnt = service.remove(event_id);
            if (rowCnt != 1) throw new Exception("Delete Failed");

            return new ResponseEntity<>("Delete Succeeded", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Delete Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}