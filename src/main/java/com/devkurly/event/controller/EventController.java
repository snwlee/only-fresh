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

//    U
    @PatchMapping("/{event_id}")
    public ResponseEntity<String> modify(@RequestBody EventDto eventDto){
        System.out.println("eventDto = " + eventDto);
        try {
            service.modify(eventDto);
            return new ResponseEntity<>("Modify Successful", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Modify Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

//    D
    @DeleteMapping("/{event_id}")
    public ResponseEntity<String> deleteEvent(@PathVariable Integer event_id) {
        try {
           int rowCnt = service.remove(event_id);
           if(rowCnt != 1) throw new Exception("Delete Failed");

            return new ResponseEntity<>("Delete Succeeded", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Delete Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}