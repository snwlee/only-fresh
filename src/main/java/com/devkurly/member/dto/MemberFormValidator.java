package com.devkurly.member.dto;

import com.devkurly.global.ErrorCode;
import com.devkurly.member.exception.SignUpException;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

public class MemberFormValidator implements ConstraintValidator<ValidMemberForm, MemberSaveRequestDto> {
    private static final int MIN_LENGTH = 5;
    private static final int MAX_LENGTH = 25;

    @Override
    public void initialize(ValidMemberForm constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(MemberSaveRequestDto requestDto, ConstraintValidatorContext context) {
        if (!requestDto.getPwd().equals(requestDto.getCPassword())) {
            System.out.println("TEST1");
            addConstraintViolation(context, "동일한 비밀번호가 아닙니다.");
            throw new SignUpException("회원가입 입력 값 오류", ErrorCode.SIGN_UP_FAIL);
        }
        if (hasWhiteSpace(requestDto.getPwd())) {
            System.out.println("TEST2");
            addConstraintViolation(context, "비밀번호에 빈칸은 허용되지 않습니다.");
            throw new SignUpException("회원가입 입력 값 오류", ErrorCode.SIGN_UP_FAIL);
        }
        if (!Pattern.matches("^(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{8,}$", requestDto.getPwd())) {
            System.out.println("TEST3");
            addConstraintViolation(context, "비밀번호 형식에 맞지 않습니다.");
            throw new SignUpException("회원가입 입력 값 오류", ErrorCode.SIGN_UP_FAIL);
        }
        if (hasWhiteSpace(requestDto.getUser_nm())) {
            System.out.println("TEST4");
            addConstraintViolation(context, "이름에 빈칸은 허용되지 않습니다.");
            throw new SignUpException("회원가입 입력 값 오류", ErrorCode.SIGN_UP_FAIL);
        }
        if (!Pattern.matches("[가-힣]{2,5}", requestDto.getUser_nm())) {
            System.out.println("TEST5");
            addConstraintViolation(context, "이름 형식에 맞지 않습니다.");
            throw new SignUpException("회원가입 입력 값 오류", ErrorCode.SIGN_UP_FAIL);
        }
        if (!Pattern.matches("^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$", requestDto.getTelno())) {
            System.out.println("TEST6");
            addConstraintViolation(context, "번호 형식에 맞지 않습니다.");
            throw new SignUpException("회원가입 입력 값 오류", ErrorCode.SIGN_UP_FAIL);
        }
        if (hasWhiteSpace(requestDto.getTelno())) {
            System.out.println("TEST7");
            addConstraintViolation(context, "번호에 빈칸은 허용되지 않습니다.");
            throw new SignUpException("회원가입 입력 값 오류", ErrorCode.SIGN_UP_FAIL);
        }
        return true;
    }

    private boolean hasWhiteSpace(String value) {
        return !value.matches("^\\S*$");
    }

    private boolean hasProperLength(String value) {
        int length = value.length();
        return length >= MIN_LENGTH && length <= MAX_LENGTH;
    }

    private void addConstraintViolation(ConstraintValidatorContext context, String errorMessage) {
        context.disableDefaultConstraintViolation();
        context.buildConstraintViolationWithTemplate(errorMessage)
                .addConstraintViolation();
    }
}
