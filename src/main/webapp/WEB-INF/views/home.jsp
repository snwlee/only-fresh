<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set
        var="signInOut"
        value="${sessionScope.memberMainResponseDto==null ? '로그인' : '로그아웃'}"
/>
<c:set
        var="signInOutLink"
        value="${sessionScope.memberMainResponseDto==null ? '/members' : '/members/signout'}"
/>
<c:set
        var="name"
        value="${sessionScope.memberMainResponseDto==null ? '회원가입' : sessionScope.memberMainResponseDto.user_nm}"
/>
<c:set
        var="nameLink"
        value="${sessionScope.memberMainResponseDto==null ? '/members/signup' : '/mypage/coupon'}"
/>
<html>
<head>
    <title>DevKurly :: 얼마나 좋아</title>
    <style>
        #contents_container {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .content_box {
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 400px;
            height: 300px;
            border: 1px solid #5F0080;
            margin-top: 20px;
            margin-right: 10px;
        }

        .btn {
            cursor: pointer;
            width: 380px;
            height: 50px;
            border-radius: 5px;
            border: none;
            background-color: #5F0080;
            color: #ffffff;
            font-size: 16px;
            font-weight: 400;
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
        }
    </style>
</head>
<body>
<h1>메인화면</h1>
<div>로그인 상태 : 유저 번호 ${sessionScope.memberMainResponseDto.user_id}</div>
<a href="${nameLink}">${name}</a>
<c:if test="${sessionScope.memberMainResponseDto != null}">
    <span>님</span>
</c:if>
<a class="btn" href="${signInOutLink}">${signInOut}</a>
<div id="contents_container">
    <%--장바구니--%>
    <div class="content_box">
        <a class="btn" href="/carts">장바구니 보기</a>
    </div>
    <%--이벤트--%>
    <div class="content_box">
        <a class="btn" href="/event/admin">이벤트 CRUD 페이지</a>
    </div>
    <%--게시판--%>
    <div class="content_box">
        <a class="btn" href="/boardlist?pdt_id=&bbs_clsf_cd=1&page=1&pageSize=10">게시판 CRUD 페이지</a>
    </div>
    <%--상품 보기--%>
    <div class="content_box">
        <a class="btn" href="/product/list?page=1&pageSize=10"/>상품 보기</a>
        <a class="btn" href="/product/newlist">신상품 보기</a>
        <a class="btn" href="/product/bestlist">베스트 상품 보기</a>
        <a class="btn" href="/product/list">알뜰쇼핑</a>
    </div>
    <%--배송지--%>
    <div class="content_box">
    </div>
</div>
</body>
</html>
