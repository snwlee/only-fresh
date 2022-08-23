package com.devkurly.admin.controller;

import com.devkurly.admin.domain.UserDto;
import com.devkurly.admin.domain.UserPageHandler;
import com.devkurly.admin.domain.UserSearchCondition;
import com.devkurly.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class UserController {
    @Autowired
    UserService userService;

    //  회원정보목록 (R)
    @GetMapping("/list")
    public String list(UserSearchCondition sc, Model m, HttpServletRequest request) {
//        if(!loginCheck(request))
//            return "redirect:/login/login?toURL="+request.getRequestURL();

        try {
            int totalCnt = userService.getUserSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            UserPageHandler userPageHandler = new UserPageHandler(totalCnt, sc);

            List<UserDto> list = userService.getUserSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", userPageHandler);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("msg","LIST_ERR");
            m.addAttribute("totalCnt",0);
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
            int rowCnt = userService.modify(userDto);

            if (rowCnt != 1)
                throw new Exception("Modify failed");

            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/admin/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(userDto);
            m.addAttribute("msg", "MOD_ERR");
            return "admin/userBoard";
        }
    }

    //  회원정보등록 c
    @PostMapping("/write")
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
            m.addAttribute(userDto);
            m.addAttribute("msg", "WRT_ERR");
            return "admin/userBoard";
        }
    }

    @GetMapping("/write")
    public String write(Model m) {
        m.addAttribute("mode", "new");
        return "admin/userBoard";
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