package com.devkurly.board.dao;

import com.devkurly.board.domain.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    int deleteAll() throws Exception;

    int delete(Integer bbs_id, Integer pdt_id, Integer user_id) throws Exception;

    int count(Map map) throws Exception;

    BoardDto select(int bbs_id) throws Exception;

    List<BoardDto> selectReviewPage(Map map) throws Exception;
    List<BoardDto> selectReviewPageLike(Map map) throws Exception;

    List<BoardDto> selectAll() throws Exception;

    BoardDto selectCn(Integer bbs_id)throws Exception;

    int insert(BoardDto boardDto) throws Exception;

    int insertCn(BoardDto boardDto) throws Exception;

    int insertReview(Integer bbs_id) throws Exception;

    int update(BoardDto boardDto) throws Exception;

    int updateCn(BoardDto boardDto) throws Exception;

    int increaseLike(Integer bbs_id) throws Exception;

    int selectUserLike(Map map) throws Exception;

    int userLikeNo(BoardDto boardDto) throws Exception;

    }
