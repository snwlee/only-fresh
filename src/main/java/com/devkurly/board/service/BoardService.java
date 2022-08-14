package com.devkurly.board.service;

import com.devkurly.board.domain.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardService {
    List<BoardDto> selectReviewPage(Map map) throws Exception;

    int remove(Integer bbs_id, Integer pdt_id, Integer user_id) throws Exception;
    int modify(BoardDto boardDto) throws Exception;

    int write(BoardDto boardDto) throws Exception;

    BoardDto readCn(Integer bbs_id) throws Exception;

    int getCount(String bbs_clsf_cd, Integer pdt_id) throws Exception;

    int increaseLike(Integer bbs_id) throws Exception;
}
