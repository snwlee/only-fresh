<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>메인화면</title>
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
			text-decoration: none;
		}
	</style>
</head>
<body>
<h1>메인화면</h1>
<div>로그인 상태 : 유저 번호 ${sessionScope.user_id}</div>
<a class="btn" href="/carts/login">유저 'user_id = 1' 로 로그인하기</a>
<a class="btn" href="/carts/view">장바구니 보기</a>
<a class="btn" href="/product/list">상품 보기</a>
</body>
</html>
