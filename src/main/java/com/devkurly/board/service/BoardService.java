package com.devkurly.board.service;

import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.domain.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardService {
    boolean isValidPdt(Integer value)throws Exception;
    List<BoardDto> selectReviewPage(Map map) throws Exception;
    List<BoardDto> selectReviewPageLike(Map map) throws Exception;
    List<BoardDto> selectInqPage(Map map) throws Exception;
    List<BoardDto> selectMyInq(Map map) throws Exception;
    List<BoardDto> selectMyReview(Map map)throws Exception;
    int remove(Integer bbs_id, Integer pdt_id, Integer user_id) throws Exception;

    int deleteAll() throws Exception;
    int modify(BoardDto boardDto) throws Exception;

    int write(BoardDto boardDto) throws Exception;

    BoardDto readCn(Integer bbs_id) throws Exception;

    int getCount(String bbs_clsf_cd, Integer pdt_id) throws Exception;

    int upDownLike(Integer bbs_id, Integer likeUpDown) throws Exception;

    int userLikeNo(BoardDto boardDto) throws Exception;

    int reviewLike(BoardDto boardDto, Integer likeUpDown)throws Exception;
    int writeAnswer(CommentDto commentDto)throws Exception;
    int modifyAnswer(CommentDto commentDto)throws Exception;
    int deleteAnswer(Integer bbs_id, int replyst) throws Exception;
    CommentDto readAnswer(Integer bbs_id)throws Exception;
    List<BoardDto> checkReview(Integer user_id)throws Exception;

}
