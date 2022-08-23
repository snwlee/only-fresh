package com.devkurly.member.dto;

import com.devkurly.member.domain.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@NoArgsConstructor
public class MemberUpdateResponseDto {
    private String user_nm;
    private String user_email;
    private String telno;

    public MemberUpdateResponseDto(Member member) {
        this.user_nm = member.getUser_nm();
        this.user_email = member.getUser_email();
        this.telno = member.getTelno();
    }
}
