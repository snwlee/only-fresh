package com.devkurly.event.controller;

import com.devkurly.event.domain.EventDto;
import com.devkurly.event.domain.EventIdDto;
import com.devkurly.event.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@Controller
@RequestMapping("/event")
public class EventController {
    @Autowired
    EventService service;

    @RequestMapping("/test")
    public String test() {
        return "event/test";
    }

    //    C
    @PostMapping(value = "/add", consumes = "application/json")
    public ResponseEntity<String> add(@RequestBody EventDto eventDto) {
        try {
            if (service.insert(eventDto) != 1) throw new Exception("Write failed");

            return new ResponseEntity<>("Success", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
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

    @GetMapping("/list")
    public ResponseEntity<List<EventDto>> getEvents() {
        List<EventDto> list = null;

        try {
            list = service.getEventList();
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/id_list")
    public ResponseEntity<List<EventIdDto>> getEventIds() {
        List<EventIdDto> list = null;

        try {
            list = service.getEventIds();
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(list, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

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
    @PatchMapping("/{event_id}")
    public ResponseEntity<String> modify(@RequestBody EventDto eventDto) {
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
            if (rowCnt != 1) throw new Exception("Delete Failed");

            return new ResponseEntity<>("Delete Succeeded", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("Delete Error", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}