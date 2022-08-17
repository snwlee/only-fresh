package com.devkurly.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    UserService UserService;

    //회원목록
    @RequestMapping("/user/list")
    public String UserList(Model model){
        List<UserDto> list = UserService.UserList();
        model.addAttribute("list", list);
        return "admin/user_list";
    }

    //회원등록 C
    @RequestMapping("/user/write")
    public String UserWrite(){
        return "admin/user_write";
    }

    @RequestMapping("user/insert")
    public String insertUser(@ModelAttribute UserDto userDto){
        UserService.insertUser(userDto);
        return "redirect:/user/list";
    }

    //회원상세정보조회 R
    @RequestMapping("/user/view")
    public String viewUser(Integer user_id, Model model) throws Exception {   //회원정보를 model에 저장
        model.addAttribute("dto",UserService.viewUser(user_id));
        logger.info("클릭한 아이디: "+user_id);
        return "admin/user_view";
    }

    //회원정보수정 U
    @RequestMapping("/user/update")
    public String updateUser(@ModelAttribute UserDto userDto) throws Exception {
        UserService.updateUser(userDto);
        return "redirect:/user/list";
    }
}
