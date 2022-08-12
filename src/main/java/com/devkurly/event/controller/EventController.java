package com.devkurly.event.controller;

import com.devkurly.event.domain.EventDto;
import com.devkurly.event.service.EventService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("/event")
public class EventController {
    @Autowired
    EventService service;

//    C
    @PostMapping()
    public ResponseEntity<String> add(@RequestBody EventDto eventDto, HttpSession session){
        System.out.println("eventDto = " + eventDto.toString());
        try {
            if(service.insert(eventDto) != 1)
                throw new Exception("Write failed");

            return new ResponseEntity<>("Write Successed", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Write Failed", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

//    R
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
    @GetMapping("/{event_id}")
    public ResponseEntity<List<EventDto>> getEvent(@PathVariable Integer event_id){
        List<EventDto> list = null;

        try {
            list = service.getEventList();
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}