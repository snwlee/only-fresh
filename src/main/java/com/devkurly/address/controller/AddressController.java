package com.devkurly.address.controller;

import com.devkurly.address.domain.AddressDto;
import com.devkurly.address.service.AddressService;
import com.devkurly.member.dto.MemberMainResponseDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/address")
public class AddressController {

    @Autowired
    AddressService addressService;

    @GetMapping("/list")
    public String list(HttpServletRequest request, Integer addr_id, HttpSession session, Model m, AddressDto addressDto) throws Exception {
        MemberMainResponseDto responseDto = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = responseDto.getUser_id();

        try {

            List<AddressDto> list = addressService.getListSelect(user_id);
            m.addAttribute("list", list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "address/listAddressForm";
    }

    @GetMapping("/read")
    public String addrModify(Integer addr_id, HttpSession session, Model m) throws Exception { //user_id, addressDto 하드코딩
        MemberMainResponseDto responseDto = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = responseDto.getUser_id(); // user_id

        try {
            AddressDto addressDto = addressService.read(addr_id);
            addressDto.setAddr_id(addr_id);
            m.addAttribute(addressDto); // model에 담아서 view로 전달

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/address/modifyAddressForm";
    }

    @PostMapping("/remove")
    public String remove(Integer addr_id, AddressDto addressDto, HttpSession session, Model m, RedirectAttributes rattr) { // addressDto, user_id 하드코딩
        MemberMainResponseDto responseDto = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = responseDto.getUser_id(); // user_id 세션 받기

        addressDto.setUser_id(user_id); // 세션으로 받아온 user_id를 Dto에 넣어준다.

        try {
            int rowCnt = addressService.remove(addressDto);

            if (rowCnt != 1) // 삭제가 되었는지
                throw new Exception("address remove error"); // 아니면 예외

                rattr.addFlashAttribute("msg", "DEL_OK"); // 삭제 성공

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR"); // 삭제 실패
        }

        return "redirect:/address/list"; // user_id 임시 하드코딩
    }

    @PostMapping("/modify")
    public String modify( Integer addr_id,  AddressDto addressDto, HttpSession session, Model m, RedirectAttributes rattr) throws Exception {
        MemberMainResponseDto responseDto = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = responseDto.getUser_id();
        addressDto.setUser_id(user_id);

        if(addressDto.getChk_addr()==null)
            addressDto.setChk_addr(false);

        try {
            int rowCnt = addressService.modify(addressDto);
            m.addAttribute(addressDto);

            if (rowCnt != 1) {
                throw new Exception("Modify failed");
            }
            rattr.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/address/list";

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(addressDto);
            m.addAttribute("msg", "MOD_ERR");
            return "/address/modifyAddressForm";
        }
    }

    @GetMapping("/insert")
    public String insert(Model m, AddressDto addressDto, HttpSession session) {
        MemberMainResponseDto responseDto = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = responseDto.getUser_id(); // user_id

//        m.addAttribute("mode", "deli");
        m.addAttribute(addressDto);
        return "/address/newAddress2Form";  // 샛별배송 표기에 사용
    }

    @PostMapping("/create")
    public String create(AddressDto addressDto, HttpSession session, Model m, RedirectAttributes rattr) throws Exception {
        MemberMainResponseDto responseDto = (MemberMainResponseDto) session.getAttribute("memberResponse");
        Integer user_id = responseDto.getUser_id(); // user_id

        System.out.println("addressDto = " + addressDto);

        if(addressDto.getChk_addr()==null)
            addressDto.setChk_addr(true);

        try {
            int rowCnt = addressService.addrInsert(addressDto);

            if (rowCnt != 1){
                throw new Exception("Insert failed");
            }
            rattr.addFlashAttribute("msg", "INS_OK");

            return "redirect:/address/list";
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute(addressDto);
            m.addAttribute("msg", "INS_ERR");
            return "/address/newAddress2Form";
        }

    }

    private String addr_tel_format(String addr_tel) {
        String regEx = "(\\d{2,3})(\\d{3,4})(\\d{4})";
        return addr_tel.replaceAll(regEx, "$1-$2-$3");
    }

}
