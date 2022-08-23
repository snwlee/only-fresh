package com.devkurly.member.dto;

import com.devkurly.member.domain.Member;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class MemberMainResponseDto {
    private Integer user_id;
    private String user_nm;
    private Character user_cls_cd;

    public MemberMainResponseDto(Member member) {
        this.user_id = member.getUser_id();
        this.user_nm = member.getUser_nm();
        this.user_cls_cd = member.getUser_cls_cd();
    }
}
