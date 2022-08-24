package com.devkurly.member.dto;

import com.devkurly.member.domain.Member;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@ValidMemberUpdateForm
public class MemberUpdateRequestDto {

    private Integer user_id;
    @NotEmpty(message = "필수 항목 입니다.")
    private String user_nm;
    @Email
    private String user_email;
    private String pwd;
    @NotEmpty(message = "필수 항목 입니다.")
    private String telno;
    private String cPassword;

    @Builder
    public MemberUpdateRequestDto(Integer user_id, String user_nm, String user_email, String pwd, String telno) {
        this.user_id = user_id;
        this.user_nm = user_nm;
        this.user_email = user_email;
        this.pwd = pwd;
        this.telno = telno;
    }

    public Member toEntity() {
        return Member.builder()
                .user_id(user_id)
                .user_nm(user_nm)
                .user_email(user_email)
                .pwd(pwd)
                .telno(telno)
                .build();
    }
}
