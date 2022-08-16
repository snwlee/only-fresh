package com.devkurly.board.dao;

import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.domain.BoardDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDaoImpl implements BoardDao {
    private SqlSession session;

    public BoardDaoImpl(SqlSession session) {
        this.session = session;
    }

    private String namespace = "com.devkurly.board.dao.boardMapper.";

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public int delete(Integer bbs_id, Integer pdt_id, Integer user_id) throws Exception {
        Map map = new HashMap();
        map.put("bbs_id", bbs_id);
        map.put("pdt_id", pdt_id);
        map.put("user_id", user_id);

        return session.delete(namespace + "delete",map);
    }

    @Override
    public int count(Map map) throws Exception {
        return session.selectOne(namespace + "boardCount", map);
    }
    @Override
    public int boardAllCnt() throws Exception {
        return session.selectOne(namespace + "boardAllCnt");
    }

    @Override
    public BoardDto select(int bbs_id) throws Exception {
        return session.selectOne(namespace + "select", bbs_id);
    }

    @Override
    public List<BoardDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<BoardDto> selectReviewPage(Map map) throws Exception {
        return session.selectList(namespace + "selectReviewPage", map);
    }

    @Override
    public List<BoardDto> selectReviewPageLike(Map map) throws Exception {
        return session.selectList(namespace + "selectReviewPageLike", map);
    }

    @Override
    public BoardDto selectCn(Integer bbs_id) throws Exception {
        return session.selectOne(namespace + "selectCn", bbs_id);
    }

    @Override
    public int insert(BoardDto boardDto) throws Exception {
        int cnLength = boardDto.getBbs_title().length();
        if(cnLength>60||cnLength==0)
            throw new Exception("제목에 적절하지 않은 글자수입니다.");
        return session.insert(namespace + "insert", boardDto);
    }

    @Override
    public int insertCn(BoardDto boardDto) throws Exception {
        int cnLength = boardDto.getBbs_cn().length();
        if(cnLength>2000||cnLength==0)
            throw new Exception("내용에 적절하지 않은 글자수입니다.");
        return session.insert(namespace + "insertCn", boardDto);
    }

    @Override
    public int insertReview(Integer bbs_id, Integer user_id) throws Exception {
        Map map = new HashMap<>();
        map.put("bbs_id", bbs_id);
        map.put("user_id", user_id);
        return session.insert(namespace + "insertReview", map);
    }

    @Override
    public int insertInq(Integer bbs_id, Integer user_id) throws Exception {
        Map map = new HashMap<>();
        map.put("bbs_id", bbs_id);
        map.put("user_id", user_id);
        return session.insert(namespace + "insertInq", map);
    }

    @Override
    public int update(BoardDto boardDto) throws Exception {
        int cnLength = boardDto.getBbs_title().length();
        if(cnLength>60||cnLength==0)
            throw new Exception("제목에 적절하지 않은 글자수입니다.");
        return session.update(namespace + "update", boardDto);
    }

    @Override
    public int updateCn(BoardDto boardDto) throws Exception {
        int cnLength = boardDto.getBbs_cn().length();
        if(cnLength>2000||cnLength==0)
            throw new Exception("내용에 적절하지 않은 글자수입니다.");
        return session.update(namespace + "updateCn", boardDto);
    }
    @Override
    public int isRepliedStatus(Integer bbs_id) throws Exception {
        return session.update(namespace + "IsRepliedStatus", bbs_id);
    }
    @Override
    public int isSecretStatus(Integer bbs_id) throws Exception {
        return session.update(namespace + "IsSecretStatus", bbs_id);
    }
    @Override
    public int increaseLike(Integer bbs_id) throws Exception {
        return session.update(namespace + "increaseLike", bbs_id);
    }
    @Override
    public int selectUserLike(Map map) throws Exception {
        return session.selectOne(namespace + "selectUserLike", map);
    }
    @Override
    public int userLikeNo(BoardDto boardDto) throws Exception {
        return session.insert(namespace + "UserLikeNo", boardDto);
    }
    @Override
    public int insertAnswer(CommentDto commentDto)throws Exception {
        return session.insert(namespace + "insertAnswer", commentDto);
    }
    @Override
    public int updateAnswer(CommentDto commentDto)throws Exception {
        return session.update(namespace + "updateAnswer", commentDto);
    }
    @Override
    public int deleteAnswer(Integer bbs_id, String gd_cd)throws Exception {
        Map map = new HashMap<>();
        map.put("bbs_id", bbs_id);
        map.put("gd_cd", gd_cd);
        return session.delete(namespace + "deleteAnswer", map);
    }
    @Override
    public CommentDto selectAnswer(Integer bbs_id) throws Exception {
        return session.selectOne(namespace + "selectAnswer", bbs_id);
    }

}
