package com.devkurly.order.dto;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.Objects;

public class OrderFormValidator implements ConstraintValidator<ValidOrderForm, OrderSaveRequestDto> {
    private static final int MIN_LENGTH = 1;
    private static final int MAX_LENGTH = 90;

    @Override
    public void initialize(ValidOrderForm constraintAnnotation) {
        ConstraintValidator.super.initialize(constraintAnnotation);
    }

    @Override
    public boolean isValid(OrderSaveRequestDto requestDto, ConstraintValidatorContext context) {
        if (Objects.isNull(requestDto.getReq_dtls())) {
            addConstraintViolation(context, "O001");
            return false;
        }
        if (!hasProperLength(requestDto.getReq_dtls())) {
            addConstraintViolation(context, String.format("O002", MIN_LENGTH, MAX_LENGTH));
            return false;
        }
        if (!requestDto.getReq_dtls().matches("^\\S*$")) {
            addConstraintViolation(context, "O003");
            return false;
        }
        return true;
    }

    private boolean hasProperLength(String userName) {
        int length = userName.length();
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
