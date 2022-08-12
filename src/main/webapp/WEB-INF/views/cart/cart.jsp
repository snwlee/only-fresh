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
    <style>
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
        }
    </style>
</head>
<body>
<div>장바구니</div>
<div>로그인 상태 : 유저 번호 ${sessionScope.user_id}</div>
<a class="btn" href="/carts/add/1">장바구니 제품 1 추가</a>
<a class="btn" href="/carts/add/2">장바구니 제품 2 추가</a>
<a class="btn" href="/carts/add/3">장바구니 제품 3 추가</a>
<a class="btn" href="/carts/update">~~장바구니 제품 1 개수 10개 추가~~</a>
<a class="btn" href="/carts/delete">~~장바구니 제품 전체 삭제~~</a>
<c:forEach var="cart" items="${cart}">
    <div>장바구니 제품 번호 : ${cart.pdt_id}</div>
    <div>장바구니 제품 이미지 : ${cart.image}</div>
    <div>장바구니 제품 이름 : ${cart.title}</div>
    <div>장바구니 제품 가격 : ${cart.sel_price}</div>
    <div>장바구니 제품 개수 : ${cart.pdt_qty}</div>
    <div>장바구니 제품 총 가격 : ${cart.sel_price * cart.pdt_qty}</div>
    <a href="/carts/up/${cart.pdt_id}">+</a>
    <a href="/carts/down/${cart.pdt_id}">-</a>
    <a href="/carts/delete/${cart.pdt_id}">장바구니에서 제거</a>
    <br>
</c:forEach>
<div>총 장바구니 가격 : ${sum}</div>
    user_id, CT.pdt_id, pdt_qty, image, sel_price, title, stock
</body>
</html>
