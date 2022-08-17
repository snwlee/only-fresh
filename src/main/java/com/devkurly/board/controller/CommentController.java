package com.devkurly.board.controller;

import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class CommentController {
    private final BoardService boardService;

    public CommentController(BoardService boardService) {
        this.boardService = boardService;
    }
    @GetMapping("/board/comment/{bbs_id}")
    public ResponseEntity<CommentDto> getComment(@PathVariable Integer bbs_id) {
        try {

            CommentDto commentDto = boardService.readAnswer(bbs_id);
            return new ResponseEntity<>(commentDto, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<CommentDto>(HttpStatus.BAD_REQUEST);
        }
    }
    @PostMapping("/board/comment/{bbs_id}")
    public ResponseEntity<String> writeComment(@PathVariable Integer bbs_id, CommentDto commentDto, HttpSession session) {
//        session.getAttribute("user_id", user_id);
        //임시 하드코딩
        Integer user_id = 1;
        String gd_cd = "2";
        commentDto.setUser_id(user_id);
        commentDto.setGd_cd(gd_cd);
        commentDto.setBbs_id(bbs_id);
        try {
            boardService.writeAnswer(commentDto);
            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @PatchMapping("/board/comment/{bbs_id}")
    public ResponseEntity<String> modifyComment(@PathVariable Integer bbs_id, CommentDto commentDto, HttpSession session) {
        //        session.getAttribute("user_id", user_id);
        //임시 하드코딩
        String gd_cd = "2";
        commentDto.setGd_cd(gd_cd);
        try {
            boardService.modifyAnswer(commentDto);
            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/board/comment/{bbs_id}")
    public ResponseEntity<String> deleteComment(@PathVariable Integer bbs_id, HttpSession session) {
        //        session.getAttribute("user_id", user_id);
        //임시 하드코딩
        String gd_cd = "2";
        try {
            boardService.deleteAnswer(bbs_id, gd_cd);
            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<String>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }
}
