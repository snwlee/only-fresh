<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/11
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>주문</title>
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
        .select-payment input[type="radio"] {
            display: none;
        }
        .select-payment input[type="radio"] + label {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            height: 50px;
            width: 180px;
            border: 1px solid #cacaca;
            border-radius: 5px;
            line-height: 24px;
            text-align: center;
            font-size: 16px;
            margin: 5px;
        }
        .select-payment input[type="radio"] + label {
            background-color: #fff;
            color: #555;
        }
        .select-payment input[type="radio"]:checked + label {
            background-color: #5F0080;
            color: #fff;
        }
    </style>
</head>
<body>
<div>주문서</div>
<div>로그인 상태 : 유저 번호 ${sessionScope.user_id}</div>
<div>주문 상품</div>
<c:forEach var="cart" items="${cart}" varStatus="status">
    <div>주문 제품 이름 : ${cart.title}</div>
    <div>주문 제품 개수 : ${cart.pdt_qty}</div>
    <div>주문 제품 총 가격 : ${cart.sel_price * cart.pdt_qty}</div>
    <br>
</c:forEach>

<h3>주문자 정보</h3>
<div>보내는 분</div>
<div>휴대폰</div>
<div>이메일</div>
<br>
<h3>배송 정보</h3>
<div>배송지</div>
<div>상세 정보</div>
<br>
<h3>쿠폰 / 적립금</h3>
<div>쿠폰 적용</div>
<div>적립금 적용</div>
<br>
<h3>결제 수단</h3>
<div>결제수단 선택</div>
<div class="select-payment">
    <input
            type="radio"
            id="credit"
            name="payment"
    /><label for="credit">신용카드</label>
    <input
            type="radio"
            id="pay"
            name="payment"
    /><label for="pay">간편 결제</label>
</div>



<a class="btn">${sum} 원 결제하기</a>
</body>
</html>
