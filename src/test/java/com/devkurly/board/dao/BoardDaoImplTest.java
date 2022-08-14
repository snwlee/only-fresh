package com.devkurly.board.dao;

import com.devkurly.board.domain.BoardDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDaoImplTest {
    @Autowired
    BoardDao boardDao;

    @Test
    public void deleteAll() throws Exception{
//        boardDao.deleteAll();
//        assertTrue(boardDao.count()==0);
//        BoardDto boardDto = new BoardDto(1,1,"asdf", "youngjun","1","1","1");
//        boardDao.insert(boardDto);
//
//        boardDao.deleteAll();

    }

    @Test
    public void delete() throws Exception{
//        boardDao.deleteAll();
//        assertTrue(boardDao.count()==0);
//        BoardDto boardDto = new BoardDto(1,1,"asdf", "youngjun","1","1","1");
//        boardDao.insert(boardDto);

//        boardDao.delete();

    }

    @Test
    public void selectCn() throws Exception {
        Map map = new HashMap();
        map.put("pdt_id", 1);
        map.put("bbs_clsf_cd", "1");
        map.put("offset", 0);
        map.put("pageSize", 10);

        Integer bbs_id = boardDao.selectReviewPage(map).get(0).getBbs_id();
        System.out.println("bbs_id = " + bbs_id);
        BoardDto boardDto = boardDao.selectCn(bbs_id);
        String bbs_cn = boardDto.getBbs_cn();
        System.out.println("bbs_cn = " + bbs_cn);
    }


    @Test
    public void count() throws Exception{
        String bbs_clsf_cd = "1";
        Integer pdt_id = 1;
        Map map = new HashMap<>();
        map.put("bbs_clsf_cd", bbs_clsf_cd);
        map.put("pdt_id", pdt_id);
        int Cnt = boardDao.count(map);
        System.out.println(Cnt);

    }
    @Test
    public void selectReviewPage() throws Exception {
        Integer page = 1;
        Integer pageSize = 10;
        Integer pdt_id = 1;
        Map map = new HashMap();
        map.put("offset", (page - 1) * pageSize);
        map.put("pageSize", pageSize);
        map.put("pdt_id", pdt_id);
        List list = boardDao.selectReviewPage(map);
        System.out.println("list = " + list);

    }




    @Test
    public void select() {
    }

    @Test
    public void selectPage() {
    }

    @Test
    public void insert()throws Exception {
//        boardDao.deleteAll();
//        assertTrue(boardDao.count()==0);
//
//        for (int i = 0; i < 5; i++) {
//            BoardDto boardDto = new BoardDto(1,1,"asdf"+i,"youngjun","1","1","1");
//            boardDao.insert(boardDto);
//        }
//        assertTrue(boardDao.deleteAll() == 5);
//        assertTrue(boardDao.count() == 0);

//        BoardDto boardDto = new BoardDto()
    }

    @Test
    public void update() throws Exception{
//        boardDao.deleteAll();
//        BoardDto boardDto = new BoardDto(1,1,"asdf","youngjun","1","1","1");
//        assertTrue(boardDao.insert(boardDto)==1);
//
//        Integer bbs_id = boardDao.selectAll().get(0).getBbs_id();
//        System.out.println("boardDao.selectAll() = " + boardDao.selectAll());
//
//        boardDto.setBbs_id(bbs_id);
//        boardDto.setBbs_title("title2");
//
//        System.out.println("boardDto.getBbs_id() = " + boardDto.getBbs_id());
//        System.out.println("boardDto.getBbs_title() = " + boardDto.getBbs_title());
//
//        assertTrue(boardDao.update(boardDto)==1);


    }

    @Test
    public void increaseLike() {
    }
}