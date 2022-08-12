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
    <title>장바구니</title>
</head>
<body>
<div>장바구니</div>
<div>로그인 상태 : 유저 번호 ${sessionScope.user_id}</div>
<a class="btn" href="/carts/add">장바구니 제품 1 추가</a>
<a class="btn" href="/carts/view">장바구니 제품 보기</a>
<a class="btn" href="/carts/update">장바구니 제품 1 개수 변경</a>
<a class="btn" href="/carts/delete">장바구니 제품 삭제</a>
<c:forEach var="cartList" items="${cartList}">
    <div>장바구니 제품 번호 : ${cartList.pdt_id}</div>
    <div>장바구니 제품 개수 : ${cartList.pdt_qty}</div>
    <br>
</c:forEach>
</body>
</html>
