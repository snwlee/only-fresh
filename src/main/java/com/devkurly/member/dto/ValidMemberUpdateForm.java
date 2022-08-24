package com.devkurly.member.dto;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = MemberUpdateFormValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD, ElementType.TYPE, ElementType.PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidMemberUpdateForm {
    String message() default "올바른 회원 정보를 입력해주세요.";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
