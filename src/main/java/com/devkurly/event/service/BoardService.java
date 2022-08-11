package com.devkurly.event.service;

import com.devkurly.event.dao.EventDao;
import org.springframework.beans.factory.annotation.Autowired;

public class BoardService {
    @Autowired
    EventDao eventDao;

    public int getCount() throws Exception {
        return eventDao.count();
    }
}
