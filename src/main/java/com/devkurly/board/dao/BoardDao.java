package com.devkurly.board.dao;

import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.domain.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    int deleteAll() throws Exception;
    int delete(Integer bbs_id, Integer pdt_id, Integer user_id) throws Exception;
    int count(Map map) throws Exception;
    int boardAllCnt() throws Exception;
    BoardDto select(int bbs_id) throws Exception;
    List<BoardDto> selectReviewPage(Map map) throws Exception;
    List<BoardDto> selectReviewPageLike(Map map) throws Exception;
    List<BoardDto> selectInqPage(Map map) throws Exception;
    List<BoardDto> selectMyInq(Map map) throws Exception;
    List<BoardDto> selectMyReview(Map map) throws Exception;
    List<BoardDto> selectAll() throws Exception;
    BoardDto selectCn(Integer bbs_id)throws Exception;
    int insert(BoardDto boardDto) throws Exception;
    int insertCn(BoardDto boardDto) throws Exception;
    int insertReview(Integer bbs_id, Integer user_id) throws Exception;
    int insertInq(Integer bbs_id, Integer user_id) throws Exception;
    int update(BoardDto boardDto) throws Exception;
    int updateCn(BoardDto boardDto) throws Exception;
    int isRepliedStatus(Integer bbs_id, int replyst)throws Exception;
    int isSecretStatus(Integer bbs_id, boolean is_secret) throws Exception;
    int upDownLike(Integer bbs_id, Integer likeUpDown) throws Exception;
    int selectUserLike(BoardDto boardDto) throws Exception;
    int userLikeNo(BoardDto boardDto) throws Exception;
    int updateUserLikeNo(BoardDto boardDto, Integer like_no)throws Exception;
    int checkLikeNoTB(BoardDto boardDto)throws Exception;
    int insertAnswer(CommentDto commentDto)throws Exception;
    int updateAnswer(CommentDto commentDto)throws Exception;
    int deleteAnswer(Integer bbs_id)throws Exception;
    CommentDto selectAnswer(Integer bbs_id) throws Exception;

    }
