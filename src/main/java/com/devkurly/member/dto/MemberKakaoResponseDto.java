package com.devkurly.member.dto;

import com.devkurly.member.domain.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
public class MemberKakaoResponseDto {
    private String user_nm;
    private String user_email;
    private String gender;
    private String telno;

    public MemberKakaoResponseDto(Member member) {
        this.user_nm = member.getUser_nm();
        this.user_email = member.getUser_email();
        this.gender = member.getGender();
        this.telno = member.getTelno();
    }
}
