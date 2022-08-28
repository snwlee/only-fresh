package com.devkurly.board.service;

import com.devkurly.board.dao.BoardDao;
import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.domain.BoardDto;
import com.devkurly.product.dao.ProductDao;
import com.devkurly.product.domain.ProductDto;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BoardServiceImpl implements BoardService {
    private BoardDao boardDao;
    private ProductDao productDao;

    public BoardServiceImpl(BoardDao boardDao, ProductDao productDao) {
        this.boardDao = boardDao;
        this.productDao = productDao;
    }
    @Override
    public String isValidPdt(Integer value)throws Exception{
        List<ProductDto> list = productDao.selectProductId();
        for (int i = 0; i < list.size(); i++) {
            Integer Pdt_id = list.get(i).getPdt_id();
            if(value==Pdt_id)
                return "PDT_OK";
        }
        return "PDT_ERR";
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
    public List<BoardDto> selectInqPage(Map map) throws Exception {
        return boardDao.selectInqPage(map);
    }
    @Override
    public List<BoardDto> selectMyInq(Map map) throws Exception {
        return boardDao.selectMyInq(map);
    }
    @Override
    public List<BoardDto> selectMyReview(Map map)throws Exception {
        return boardDao.selectMyReview(map);
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
        boardDao.isSecretStatus(boardDto.getBbs_id(),boardDto.isIs_secret());
        boardDao.update(boardDto);
        return boardDao.updateCn(boardDto);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(BoardDto boardDto) throws Exception {
        if(!boardDto.getBbs_clsf_cd().equals("1")&!boardDto.getBbs_clsf_cd().equals("2"))
            throw new Exception("잘못된 게시판 접근입니다.");

        if(isValidPdt(boardDto.getPdt_id()).equals("PDT_ERR"))
            throw new Exception("없는 상품 ID입니다.");
        boardDao.insert(boardDto);
        List<BoardDto> list = boardDao.selectAll();
        Integer bbs_id = list.get(0).getBbs_id();
        boardDto.setBbs_id(bbs_id);
        if(boardDto.getBbs_clsf_cd().equals("2")) {
            boardDao.insertInq(bbs_id, boardDto.getUser_id());
            //비밀글 작성을 눌렀으면
            if(boardDto.isIs_secret()==true)
                boardDao.isSecretStatus(bbs_id,boardDto.isIs_secret());
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
    public int upDownLike(Integer bbs_id, Integer likeUpDown) throws Exception {
        return boardDao.upDownLike(bbs_id, likeUpDown);
    }
    @Override
    public int userLikeNo(BoardDto boardDto) throws Exception {
        return boardDao.userLikeNo(boardDto);
    }
    @Override
    @Transactional
    public int reviewLike(BoardDto boardDto, Integer likeUpDown) throws Exception {
        if(boardDao.checkLikeNoTB(boardDto)==0){ //첫 추천이라면
            boardDao.userLikeNo(boardDto); //USER_LIKE_NO TB 생성
            boardDao.updateUserLikeNo(boardDto,1); //like_no를 1
        } else if(boardDao.checkLikeNoTB(boardDto)==1){
            if(likeUpDown==-1){ //만약 이미 추천하여 예외가 발생했고 취소를 하려는 상황이라면
                boardDao.updateUserLikeNo(boardDto,0); //like_no를 0
            }else{ //추천수를 올리려는 시도
                if(boardDao.selectUserLike(boardDto)==1) { //like_no가 이미 1이면
                    throw new Exception(); //예외 발생
                }
                boardDao.updateUserLikeNo(boardDto,1); //like_no를 1
            }
        }
        return boardDao.upDownLike(boardDto.getBbs_id(),likeUpDown); //likeUpDown값을 revew_like에 더한다.
    }
    @Transactional
    @Override
    public int writeAnswer(CommentDto commentDto)throws Exception {
        boardDao.isRepliedStatus(commentDto.getBbs_id(),commentDto.getReplyst());
        return boardDao.insertAnswer(commentDto);
    }
    @Override
    public int modifyAnswer(CommentDto commentDto)throws Exception {
        return boardDao.updateAnswer(commentDto);
    }
    @Transactional
    @Override
    public int deleteAnswer(Integer bbs_id, int replyst) throws Exception {
        boardDao.isRepliedStatus(bbs_id, replyst);
        return boardDao.deleteAnswer(bbs_id);
    }
    @Override
    public CommentDto readAnswer(Integer bbs_id)throws Exception {
        return boardDao.selectAnswer(bbs_id);
    }
    @Override
    public List<BoardDto> checkReview(Integer user_id)throws Exception {
        return boardDao.checkReview(user_id);
    }
}
