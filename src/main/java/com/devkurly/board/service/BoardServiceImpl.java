package com.devkurly.board.service;

import com.devkurly.board.dao.BoardDao;
import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.domain.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {
    private final BoardDao boardDao;

    public BoardServiceImpl(BoardDao boardDao) {
        this.boardDao = boardDao;
    }

    @Override
    public List<BoardDto> selectReviewPage(Map map) throws Exception {
        return boardDao.selectReviewPage(map);
    }
    @Override
    public List<BoardDto> selectReviewPageLike(Map map) throws Exception {
        return boardDao.selectReviewPageLike(map);
    }

    @Override
    public int remove(Integer bbs_id, Integer pdt_id, Integer user_id) throws Exception {
        return boardDao.delete(bbs_id, pdt_id, user_id);
    }
    @Override
    public int deleteAll()throws Exception {
        return boardDao.deleteAll();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int modify(BoardDto boardDto) throws Exception {
        boardDao.update(boardDto);
        return boardDao.updateCn(boardDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(BoardDto boardDto) throws Exception {
        boardDao.insert(boardDto);
        List<BoardDto> list = boardDao.selectAll();
        Integer bbs_id = list.get(0).getBbs_id();
        boardDto.setBbs_id(bbs_id);
        if(boardDto.getBbs_clsf_cd().equals("2")) {
            boardDao.insertInq(bbs_id, boardDto.getUser_id());
            //비밀글 작성을 눌렀으면
            if(boardDto.isIs_secret()==true)
                boardDao.isSecretStatus(bbs_id);
            return boardDao.insertCn(boardDto);
        }
        boardDao.insertReview(bbs_id, boardDto.getUser_id());
        return boardDao.insertCn(boardDto);
    }

    @Override
    public BoardDto readCn(Integer bbs_id) throws Exception {

        return boardDao.selectCn(bbs_id);
    }

    @Override
    public int getCount(String bbs_clsf_cd, Integer pdt_id) throws Exception {
        Map map = new HashMap();
        map.put("bbs_clsf_cd", bbs_clsf_cd);
        map.put("pdt_id", pdt_id);
        return boardDao.count(map);
    }
    @Override
    public int increaseLike(Integer bbs_id) throws Exception {
        return boardDao.increaseLike(bbs_id);
    }
    @Override
    public int userLikeNo(BoardDto boardDto) throws Exception {
        return boardDao.userLikeNo(boardDto);
    }
    @Override
    @Transactional
    public int reviewLike(BoardDto boardDto) throws Exception {
        Map map = new HashMap<>();
        map.put("user_id",boardDto.getUser_id());
        map.put("bbs_id",boardDto.getBbs_id());
        if(boardDao.selectUserLike(map)==1) {
            throw new Exception();
        }else{
            boardDto.setLike_no(1);
            boardDao.userLikeNo(boardDto);
            return boardDao.increaseLike(boardDto.getBbs_id());
        }
    }
    @Override
    public int writeAnswer(CommentDto commentDto)throws Exception {
        return boardDao.insertAnswer(commentDto);
    }
    @Override
    public int modifyAnswer(CommentDto commentDto)throws Exception {
        return boardDao.updateAnswer(commentDto);
    }
    @Override
    public int deleteAnswer(Integer bbs_id, String gd_cd) throws Exception {
        return boardDao.deleteAnswer(bbs_id, gd_cd);
    }
    @Override
    public CommentDto readAnswer(Integer bbs_id)throws Exception {
        return boardDao.selectAnswer(bbs_id);
    }
}
