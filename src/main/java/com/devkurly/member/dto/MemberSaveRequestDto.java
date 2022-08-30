package com.devkurly.member.dto;

import com.devkurly.member.domain.Member;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.*;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@ValidMemberForm
public class MemberSaveRequestDto {

    @NotEmpty(message = "필수 항목 입니다.")
    private String user_nm;
    @Email
    private String user_email;
    private String pwd;
    @NotEmpty(message = "필수 항목 입니다.")
    private String telno;
    private Date subs_dt;
    @NotEmpty(message = "필수 항목 입니다.")
    private String gender;
//    @Past
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    private Date bryr;
    private Character prvc_arge;
    private Character user_cls_cd;
    @Email
    private String rcmdr_email;

    private String cPassword;
    @Builder
    public MemberSaveRequestDto(String user_nm, String user_email, String pwd, String telno, Date subs_dt, String gender, Character prvc_arge, Character user_cls_cd, String rcmdr_email) {
        this.user_nm = user_nm;
        this.user_email = user_email;
        this.pwd = pwd;
        this.telno = telno;
        this.subs_dt = subs_dt;
        this.gender = gender;
//        this.bryr = bryr;
        this.prvc_arge = prvc_arge;
        this.user_cls_cd = user_cls_cd;
        this.rcmdr_email = rcmdr_email;
    }

    public Member toEntity() {
        return Member.builder()
                .user_nm(user_nm)
                .user_email(user_email)
                .pwd(pwd)
                .telno(telno)
                .subs_dt(subs_dt)
                .gender(gender)
//                .bryr(bryr)
                .prvc_arge(prvc_arge)
                .user_cls_cd(user_cls_cd)
                .rcmdr_email(rcmdr_email)
                .build();
    }
}
