package com.devkurly.member.interceptor;

import com.devkurly.global.ErrorCode;
import com.devkurly.member.exception.SignInException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

@Component
public class MemberSignInInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws SignInException {
        Optional.ofNullable(request.getSession().getAttribute("user_id"))
                .orElseThrow(() ->
                        new SignInException("로그인이 필요합니다.", ErrorCode.SIGN_IN_FAIL));
        return true;
    }
}
