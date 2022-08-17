package com.devkurly.member.dto;

import com.devkurly.order.dto.OrderSaveRequestDto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.Objects;

public class MemberFormValidator implements ConstraintValidator<ValidMemberForm, MemberSaveRequestDto> {
    private static final int MIN_LENGTH = 1;
    private static final int MAX_LENGTH = 25;

    @Override
    public void initialize(ValidMemberForm constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(MemberSaveRequestDto requestDto, ConstraintValidatorContext context) {
        if (Objects.isNull(requestDto.getUser_email())) {
            addConstraintViolation(context, "M001");
            return false;
        }
        if (!hasProperLength(requestDto.getUser_email())) {
            addConstraintViolation(context, String.format("M002", MIN_LENGTH, MAX_LENGTH));
            return false;
        }
        if (hasWhiteSpace(requestDto.getUser_email())) {
            addConstraintViolation(context, "M003");
            return false;
        }
        if (Objects.isNull(requestDto.getPwd())) {
            addConstraintViolation(context, "M011");
            return false;
        }
        if (!hasProperLength(requestDto.getPwd())) {
            addConstraintViolation(context, String.format("M012", MIN_LENGTH, MAX_LENGTH));
            return false;
        }
        if (hasWhiteSpace(requestDto.getPwd())) {
            addConstraintViolation(context, "M013");
            return false;
        }
        if (Objects.isNull(requestDto.getUser_nm())) {
            addConstraintViolation(context, "M021");
            return false;
        }
        if (!hasProperLength(requestDto.getUser_nm())) {
            addConstraintViolation(context, String.format("M022", MIN_LENGTH, MAX_LENGTH));
            return false;
        }
        if (hasWhiteSpace(requestDto.getUser_nm())) {
            addConstraintViolation(context, "M023");
            return false;
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
//                .addPropertyNode(firstNode)
//                .addPropertyNode(secondNode)
//                .addPropertyNode(thirdNode)
                .addConstraintViolation();
    }
}
