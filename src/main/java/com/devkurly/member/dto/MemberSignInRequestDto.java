package com.devkurly.member.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@Builder
public class MemberSignInRequestDto {
//    @Email
    private String user_email;
//    @NotBlank
    private String pwd;
}
