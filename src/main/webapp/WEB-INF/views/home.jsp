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
        value="${sessionScope.memberResponse==null ? '로그인' : '로그아웃'}"
/>
<c:set
        var="signInOutLink"
        value="${sessionScope.memberResponse==null ? '/members' : '/members/signout'}"
/>
<c:set
        var="name"
        value="${sessionScope.memberResponse==null ? '회원가입' : sessionScope.memberResponse.user_nm}"
/>
<c:set
        var="nameLink"
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage/coupon'}"
/>
<html>
<head>
    <title>DevKurly :: 얼마나 좋아</title>
</head>
<body>
<div>로그인 상태 : 유저 번호 ${sessionScope.memberResponse.user_id}</div>
<a href="${nameLink}">${name}</a>
<c:if test="${sessionScope.memberResponse != null}">
    <span>님</span>
</c:if>
<a class="btn" href="/members/test">[임시] 34번 유저로 로그인</a>
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
2    </div>
    <%--상품 보기--%>
    <div class="content_box">
        <a class="btn" href="/product/list?page=1&pageSize=10"/>상품 보기</a>
        <a class="btn" href="/product/newlist?page=1&pageSize=10">신상품 보기</a>
        <a class="btn" href="/product/bestlist?page=1&pageSize=10">베스트 상품 보기</a>
        <a class="btn" href="/product/thriftylist?page=1&pageSize=10">알뜰쇼핑</a>
        <a class="btn" href="/product/EventList">이벤트 클릭 시 이동 상품페이지 </a>
    </div>
    <%--배송지--%>
    <div class="content_box">
    </div>
</div>
<a class="btn" href="/admin/list">회원관리</a>
</body>
</html>
