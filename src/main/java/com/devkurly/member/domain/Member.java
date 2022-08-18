package com.devkurly.member.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Calendar;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class Member {
    private Integer user_id;
    private String user_nm;
    private String user_email;
    private String pwd;
    private String telno;
    private Date subs_dt;
    private String gender;
    private Date bryr;
    private Character prvc_arge;
    private Character user_cls_cd;
    private String rcmdr_email;
    private Integer pnt;

//    public void updateMember(Integer user_id, Integer pdt_id) {
//        this.user_id = user_id;
//        this.pdt_id = pdt_id;
//    }

    @Builder
    public Member(Integer user_id, String user_nm, String user_email, String pwd, String telno, Date subs_dt, String gender, Date bryr, Character prvc_arge, Character user_cls_cd, String rcmdr_email, Integer pnt) {
        this.user_id = user_id;
        this.user_nm = user_nm;
        this.user_email = user_email;
        this.pwd = pwd;
        this.telno = telno;
        this.subs_dt = subs_dt;
        this.gender = gender;
        this.bryr = bryr;
        this.prvc_arge = prvc_arge;
        this.user_cls_cd = user_cls_cd;
        this.rcmdr_email = rcmdr_email;
        this.pnt = pnt;
    }
}
