package com.devkurly.admin.controller;

import com.devkurly.admin.domain.UserDto;
import com.devkurly.admin.domain.UserPageHandler;
import com.devkurly.admin.service.UserService;
import com.devkurly.admin.domain.UserPageHandler;
import com.devkurly.board.domain.BoardDto;
import com.devkurly.board.domain.PageHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class UserController {
    @Autowired
    UserService userService;

    //  회원정보목록 (R)
    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m, HttpServletRequest request) {
//        if(!loginCheck(request))
//            return "redirect:/login/login?toURL="+request.getRequestURL();

        if (page == null) page = 1;
        if (pageSize == null) pageSize = 10;

        try {

            int totalCnt = userService.getCount();
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

            Map map = new HashMap();
            map.put("offset", (page - 1) * pageSize);
            map.put("pageSize", pageSize);

            List<UserDto> list = userService.getPage(map);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler); //pageHandler가 가지고 있는 값이 있으니 jsp로넘겨주면 jsp에서 페이징
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "admin/userList";
    }

    //  회원정보삭제 (D)
    @PostMapping("/remove")
    public String remove(Integer user_id, Integer page, Integer pageSize, Model m, RedirectAttributes rattr) {
        try {
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            int rowCnt = userService.remove(user_id);

            if (rowCnt != 1) {
                throw new Exception("board remove error");
            }

            rattr.addFlashAttribute("msg", "DEL_OK");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/admin/list";
    }

    //  회원정보수정 u
    @PostMapping("/modify")
    public String modify(UserDto userDto, Model m, HttpSession session, RedirectAttributes rattr) {

        try {
            int rowCnt = userService.modify(userDto); // insert

            if (rowCnt != 1)
                throw new Exception("Modify failed");

            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/admin/list";  //성공시
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(userDto);
            m.addAttribute("msg", "MOD_ERR");
            return "admin/userBoard"; //실패시
        }
    }

    //  회원정보등록 c
    @PostMapping("/write")  //Dto로 작성한 내용을 받음 -> Dto에 글쓴 사람의 id 를 담아줘야 함(session필요. 주석부분 해석 잘 안됨)
    public String write(UserDto userDto, Model m, HttpSession session, RedirectAttributes rattr) {
//        String writer = (String)session.getAttribute("id");
//        userDto.setWriter(writer);
        try {
            int rowCnt = userService.insert(userDto); // insert
            if (rowCnt != 1)
                throw new Exception("Write failed");

            rattr.addFlashAttribute("msg", "WRT_OK");

            return "redirect:/admin/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(userDto);    //Model m을 이용해서 입력했던 내용을 돌려줌
            m.addAttribute("msg", "WRT_ERR");   //에러메세지창
            return "admin/userBoard";
        }
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "admin/userBoard"; //userBoard.jsp를 R과 C에 둘다 사용. 쓰기(mode=new)
    }

    //회원정보상세조회
    @GetMapping("/read")
    public String read(Integer user_id, Integer page, Integer pageSize, Model m) {
        try {
            UserDto userDto = userService.read(user_id);
            m.addAttribute(userDto);
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/userBoard";
    }

    // log-in check
//    private boolean loginCheck(HttpServletRequest request) {
//        HttpSession session = request.getSession();
//        return session.getAttribute("id")!=null;
//    }


}