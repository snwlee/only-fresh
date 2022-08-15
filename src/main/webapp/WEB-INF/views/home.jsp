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
<div>로그인 상태 : 유저 번호 ${sessionScope.user_id}</div>
<a class="btn" href="/dev_kurly/carts/login">유저 'user_id = 1' 로 로그인하기</a>
<div id="contents_container" >
<%--장바구니--%>
	<div class="content_box">
		<a class="btn" href="/dev_kurly/carts/view">장바구니 보기</a>
	</div>
<%--이벤트--%>
	<div class="content_box">
		<a class="btn" href="/dev_kurly/event/test">이벤트 CRUD 페이지</a>
	</div>
<%--게시판--%>
	<div class="content_box">
		<a class="btn" href="/dev_kurly/boardlist?pdt_id=&bbs_clsf_cd=1&page=1&pageSize=10">게시판 CRUD 페이지</a>
	</div>
<%--상품 보기--%>
	<div class="content_box">
		<a class="btn" href="/dev_kurly/product/list">상품 보기</a>
		<a class="btn" href="/dev_kurly/product/newlist">신상품 보기</a>
		<a class="btn" href="/dev_kurly/product/bestlist">베스트 상품 보기</a>
		<a class="btn" href="/dev_kurly/product/list">알뜰쇼핑</a>
	</div>
<%--배송지--%>
	<div class="content_box">
	</div>
</div>>
</body>
</html>
