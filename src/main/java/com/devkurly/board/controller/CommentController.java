package com.devkurly.board.controller;

import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.service.BoardService;
import com.devkurly.member.dto.MemberMainResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
public class CommentController {
    private final BoardService boardService;

    public CommentController(BoardService boardService) {
        this.boardService = boardService;
    }
    private String cleanXSS(String value) {
        value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
        value = value.replaceAll("\\(", "& #40;").replaceAll("\\)", "& #41;");
        value = value.replaceAll("'", "& #39;");
        value = value.replaceAll("eval\\((.*)\\)", "");
        value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
        value = value.replaceAll("script", "");
        return value;
    }

    @PostMapping("/board/comment/{bbs_id}")
    public ResponseEntity<String> writeComment(@PathVariable Integer bbs_id, int replyst, @RequestBody CommentDto commentDto, HttpSession session) {
        Integer user_id = ((MemberMainResponseDto) session.getAttribute("memberResponse")).getUser_id();
        commentDto.setUser_id(user_id);
        commentDto.setBbs_id(bbs_id);
        commentDto.setReplyst(replyst);
        commentDto.setInq_ans(cleanXSS(commentDto.getInq_ans()));
        try {
            boardService.writeAnswer(commentDto);
            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @PatchMapping("/board/comment/{bbs_id}")
    public ResponseEntity<String> modifyComment(@PathVariable Integer bbs_id, @RequestBody CommentDto commentDto, HttpSession session) {
        commentDto.setBbs_id(bbs_id);
        commentDto.setInq_ans(cleanXSS(commentDto.getInq_ans()));
        try {
            boardService.modifyAnswer(commentDto);
            return new ResponseEntity<String>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/board/comment/{bbs_id}")
    public ResponseEntity<String> deleteComment(@PathVariable Integer bbs_id, int replyst, String bbs_clsf_cd, HttpSession session) {

        try {
            boardService.deleteAnswer(bbs_id, replyst);
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }
}
