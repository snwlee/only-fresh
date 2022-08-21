package com.devkurly.member.interceptor;

import com.devkurly.global.ErrorCode;
import com.devkurly.member.exception.SignInException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class MemberVerifyInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws SignInException {
        if ((Long.parseLong(request.getParameter("user_id")) != ((Long) request.getSession().getAttribute("user_id")))) {
            throw new SignInException("잘못된 접근입니다.", ErrorCode.SIGN_IN_FAIL);
        }
        return true;
    }
}
