package com.devkurly.member.dto;

import com.devkurly.cart.domain.Cart;
import com.devkurly.member.domain.Member;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Calendar;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@ValidMemberForm
public class MemberSaveRequestDto {
    @NotBlank
    private Integer user_id;
    @NotBlank
    private String user_nm;
    @Email
    private String user_email;

    private String pwd;
    private Integer telno;
    private Date subs_dt;
    private String gender;
    private Date bryr;
    private Character prvc_arge;
    private Character user_cls_cd;
    private String rcmdr_email;
    private Integer pnt;

    @Builder
    public MemberSaveRequestDto(Integer user_id, String user_nm, String user_email, String pwd, Integer telno, Date subs_dt, String gender, Date bryr, Character prvc_arge, Character user_cls_cd, String rcmdr_email, Integer pnt) {
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

    public Member toEntity() {
        return Member.builder()
                .user_id(user_id)
                .user_nm(user_nm)
                .user_email(user_email)
                .pwd(pwd)
                .telno(telno)
                .subs_dt(subs_dt)
                .gender(gender)
                .bryr(bryr)
                .prvc_arge(prvc_arge)
                .user_cls_cd(user_cls_cd)
                .rcmdr_email(rcmdr_email)
                .pnt(pnt)
                .build();
    }
}
