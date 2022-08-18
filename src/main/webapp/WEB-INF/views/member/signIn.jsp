<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>DevKurly :: 로그인</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div class="member-out-box">
    <form
            action="/members"
            method="post"
    >
        <div class="member-submit-box">
            <div class="member-title">로그인</div>
            <button
                    id="kakao"
                    class="sns-btn"
                    onclick="location.href=''"
                    type="button"
            >
                <img
                        id="kakao-img"
                        src="https://www.svgrepo.com/show/368252/kakao.svg"
                        style="height: 24px"
                />
                <span class="sns-text">카카오 로그인</span>
            </button>
            <div class="warning-msg" id="msg">${param.error}</div>
            <input
                    class="member-input-text"
                    type="text"
                    name="user_email"
                    value="${cookie.email.value}"
                    placeholder="이메일"
            />
            <input
                    class="member-input-text"
                    type="password"
                    name="pwd"
                    placeholder="비밀번호"
            />
            <input type="hidden" name="toURL" value="${param.toURL}"/>
            <label class="remember-id">
                <input type="checkbox" name="rememberId" ${empty cookie.email.value ? "" : "checked"}>
                ID 기억하기
            </label>
            <a href="#">아이디 찾기</a>
            <a href="#">비밀번호 찾기</a>
            <button class="member-btn-a" type="submit">로그인</button>
        </div>
    </form>
    <a href="/members/signup"><button class=member-btn-b">회원가입</button></a>
</div>
</body>
</html>
