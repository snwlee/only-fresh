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
</head>
<body>
<h1>메인화면</h1>
<div>로그인 상태 : 유저 번호 ${sessionScope.user_id}</div>
<a href="/carts/login">유저 1로 로그인하기</a>
<a href="/carts/view">장바구니 보기</a>
<a href="product/list">상품 보기</a>
</body>
</html>
