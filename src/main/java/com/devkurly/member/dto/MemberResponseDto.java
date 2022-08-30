package com.devkurly.member.dto;

import com.devkurly.member.domain.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.Date;

@Getter
@NoArgsConstructor
public class MemberResponseDto {
    private Integer user_id;
    private String user_nm;
    private String user_email;
    private String pwd;
    private String telno;
    private Date subs_dt;
    private String gender;
//    private Date bryr;
    private Character prvc_arge;
    private Character user_cls_cd;
    private String rcmdr_email;
    private Integer pnt;

    public MemberResponseDto(Member member) {
        this.user_id = member.getUser_id();
        this.user_nm = member.getUser_nm();
        this.user_email = member.getUser_email();
        this.pwd = member.getPwd();
        this.telno = member.getTelno();
        this.subs_dt = member.getSubs_dt();
        this.gender = member.getGender();
//        this.bryr = member.getBryr();
        this.prvc_arge = member.getPrvc_arge();
        this.user_cls_cd = member.getUser_cls_cd();
        this.rcmdr_email = member.getRcmdr_email();
        this.pnt = member.getPnt();
    }
}
