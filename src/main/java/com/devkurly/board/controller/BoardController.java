package com.devkurly.board.controller;
import com.devkurly.board.domain.BoardDto;
import com.devkurly.board.domain.PageHandler;
import com.devkurly.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BoardController {
    @Autowired
    BoardService boardService;

    @GetMapping("/boardlist")
    public String board(Integer pdt_id, String bbs_clsf_cd, Integer page, Integer pageSize, Model m) {
        try {
            if (!bbs_clsf_cd.equals("1"))
                throw new Exception("not review board");
            int totalCnt = boardService.getCount(bbs_clsf_cd, pdt_id);
            PageHandler ph = new PageHandler(totalCnt, page, pageSize);
            m.addAttribute("totalCnt", totalCnt);
            m.addAttribute("ph", ph);
            m.addAttribute("pdt_id", pdt_id);
            m.addAttribute("bbs_clsf_cd", bbs_clsf_cd);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board/board";
    }

    @GetMapping("/board")
    @ResponseBody
    public ResponseEntity<List<BoardDto>> list(Integer pdt_id, String bbs_clsf_cd, Integer page, Integer pageSize, String sortType) {
        Map map = new HashMap();
        map.put("offset", (page - 1) * pageSize);
        map.put("pageSize", pageSize);
        map.put("pdt_id", pdt_id);
        map.put("bbs_clsf_cd", bbs_clsf_cd);
        List<BoardDto> list = null;
        try {
            if(sortType.equals("like")){
                list = boardService.selectReviewPageLike(map);
            }
            else{list = boardService.selectReviewPage(map);}

            return new ResponseEntity<List<BoardDto>>(list, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<BoardDto>>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/board")
    @ResponseBody
    public ResponseEntity<String> write(Integer pdt_id, String bbs_clsf_cd, @RequestBody BoardDto boardDto, HttpSession session) {
//        int user_id = (int) session.getAttribute("user_id");
        boardDto.setUser_id(1); //임시 하드코딩
        boardDto.setPdt_id(pdt_id);
        boardDto.setBbs_clsf_cd(bbs_clsf_cd);
        boardDto.setUser_nm("youngjun"); //임시 하드코딩

        try {
            int rowCnt = boardService.write(boardDto);
            if (rowCnt != 1)
                throw new Exception("write error");

            return new ResponseEntity<String>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @PatchMapping("/board/{bbs_id}")
    @ResponseBody
    public ResponseEntity<String> modify(@PathVariable Integer bbs_id, Integer pdt_id, @RequestBody BoardDto boardDto, HttpSession session) {
//        int user_id = (int) session.getAttribute("user_id");
        boardDto.setUser_id(1); //임시 하드코딩
        boardDto.setBbs_id(bbs_id);
        boardDto.setPdt_id(pdt_id);
        try {
            int rowCnt = boardService.modify(boardDto);
            if (rowCnt != 1)
                throw new Exception("modify error");

            return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/board/{bbs_id}")
    @ResponseBody
    public ResponseEntity<String> delete(@PathVariable Integer bbs_id, Integer pdt_id, HttpSession session) {
//        int user_id = (int) session.getAttribute("user_id");
        Integer user_id = 1;  //임시 하드코딩

        try {
            int rowCnt = boardService.remove(bbs_id, pdt_id, user_id);
            if (rowCnt != 1)
                throw new Exception("delete error");

            return new ResponseEntity<String>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/board/{bbs_id}")
    public ResponseEntity<BoardDto> read(@PathVariable Integer bbs_id) {
        try {
            BoardDto boardDto = boardService.readCn(bbs_id);
            return new ResponseEntity<BoardDto>(boardDto, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<BoardDto>(HttpStatus.BAD_REQUEST);

        }
    }

    @PatchMapping("/like/{bbs_id}")
    @ResponseBody
    public ResponseEntity<String> likeUp(@PathVariable Integer bbs_id, Integer user_id) {
        BoardDto boardDto = new BoardDto();
        boardDto.setUser_id(user_id);
        boardDto.setBbs_id(bbs_id);
        try {
            int rowCnt = boardService.reviewLike(boardDto);
            return new ResponseEntity<String>(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("like_ERR",HttpStatus.BAD_REQUEST);
        }
    }
}
