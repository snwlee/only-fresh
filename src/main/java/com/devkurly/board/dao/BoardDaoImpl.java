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
    public List<BoardDto> selectInqPage(Map map) throws Exception {
        return session.selectList(namespace + "selectInqPage", map);
    }
    @Override
    public List<BoardDto> selectMyInq(Map map) throws Exception {
        return session.selectList(namespace + "selectMyInq", map);
    }
    @Override
    public List<BoardDto> selectMyReview(Map map) throws Exception {
        return session.selectList(namespace + "selectMyReview", map);
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
    public int isRepliedStatus(Integer bbs_id , int replyst) throws Exception {
        Map map = new HashMap<>();
        map.put("bbs_id", bbs_id);
        map.put("replyst", replyst);
        return session.update(namespace + "IsRepliedStatus", map);
    }
    @Override
    public int isSecretStatus(Integer bbs_id, boolean is_secret) throws Exception {
        Map map = new HashMap();
        map.put("bbs_id", bbs_id);
        map.put("is_secret", is_secret);
        return session.update(namespace + "IsSecretStatus", map);
    }
    @Override
    public int upDownLike(Integer bbs_id, Integer likeUpDown) throws Exception {
        Map map = new HashMap<>();
        map.put("bbs_id", bbs_id);
        map.put("likeUpDown", likeUpDown);
        return session.update(namespace + "upDownLike", map);
    }
    @Override
    public int checkLikeNoTB(BoardDto boardDto)throws Exception {
        return session.selectOne(namespace + "checkLikeNoTB", boardDto);
    }
    @Override
    public int selectUserLike(BoardDto boardDto) throws Exception {
        return session.selectOne(namespace + "selectUserLike", boardDto);
    }
    @Override
    public int userLikeNo(BoardDto boardDto) throws Exception {
        return session.insert(namespace + "UserLikeNo", boardDto);
    }
    @Override
    public int updateUserLikeNo(BoardDto boardDto, Integer like_no)throws Exception {
        Map map = new HashMap<>();
        map.put("user_id", boardDto.getUser_id());
        map.put("bbs_id", boardDto.getBbs_id());
        map.put("like_no", like_no);
        System.out.println("map = " + map);
        return session.update(namespace + "updateUserLikeNo", map);
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
    public int deleteAnswer(Integer bbs_id)throws Exception {

        return session.delete(namespace + "deleteAnswer", bbs_id);
    }
    @Override
    public CommentDto selectAnswer(Integer bbs_id) throws Exception {
        return session.selectOne(namespace + "selectAnswer", bbs_id);
    }

}
