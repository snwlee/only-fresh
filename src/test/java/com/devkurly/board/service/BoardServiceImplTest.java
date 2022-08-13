package com.devkurly.board.service;

import com.devkurly.board.domain.BoardDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardServiceImplTest {
@Autowired
BoardService boardService;
    @Test
    public void write() throws Exception{
        BoardDto boardDto = new BoardDto();
        boardDto.setUser_id(1);
        boardDto.setPdt_id(1);
        boardDto.setBbs_clsf_cd("1");
        boardDto.setUser_nm("youngjun");

        for (int i = 1; i < 201; i++) {
            boardDto.setBbs_title(String.valueOf(i));
            boardDto.setBbs_cn(String.valueOf(i));
            boardService.write(boardDto);
        }


    }
}