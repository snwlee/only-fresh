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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div>장바구니</div>
<div>로그인 상태 : 유저 번호 ${sessionScope.user_id}</div>
<a class="btn" href="/carts/add/1">장바구니 제품 1 추가</a>
<a class="btn" href="/carts/add/2">장바구니 제품 2 추가</a>
<a class="btn" href="/carts/add/3">장바구니 제품 3 추가</a>
<a class="btn" href="/carts/update">~~장바구니 제품 1 개수 10개 추가~~</a>
<a class="btn" href="/carts/delete">~~장바구니 제품 전체 삭제~~</a>
<c:forEach var="cart" items="${cart}" varStatus="status">
    <div>장바구니 제품 번호 : ${cart.pdt_id}</div>
    <div>장바구니 제품 이름 : ${cart.title}</div>
    <div>장바구니 제품 가격 : ${cart.sel_price}</div>
    <div id="cart-${status.count}">장바구니 제품 개수 : ${cart.pdt_qty}</div>
    <input type="number" id="cart-qty-${status.count}" value="${cart.pdt_qty}">
    <button type="button" id="add-test-btn-${status.count}">+</button>
    <button type="button" id="minus-test-btn-${status.count}">-</button>
    <div id="cart-sum-${status.count}">장바구니 제품 총 가격 : ${cart.sel_price * cart.pdt_qty}</div>
    <a class="btn" href="/carts/delete/${cart.pdt_id}">장바구니에서 제거</a>
    <a class="btn" id="plus-${status.count}">상품 추가 +</a>
    <a class="btn" id="minus-${status.count}">상품 제거 -</a>
    <br>
    <script>
        <%--$("#add-test-btn-${status.count}").click(function () {--%>
        <%--    let qty = $('#test-${status.count}').val();--%>
        <%--    let val = $('#test-${status.count}').val(qty - 1 + 2);--%>
        <%--});--%>
        <%--$("#minus-test-btn-${status.count}").click(function () {--%>
        <%--    let qty = $('#test-${status.count}').val();--%>
        <%--    let val1 = $('#test-${status.count}').val(qty - 1);--%>
        <%--});--%>
    </script>
    <script>
        $(document).ready(function () {
            $("#add-test-btn-${status.count}").click(function () {
                let val = $('#cart-qty-${status.count}').val($('#cart-qty-${status.count}').val() - 1 + 2);
                let cart = {
                    user_id:${sessionScope.user_id},
                    pdt_id:${cart.pdt_id},
                    pdt_qty: $('#cart-qty-${status.count}').val()
                };
                let cartJs = {};
                $.ajax({
                    type: 'POST',
                    url: '/carts/qty',
                    headers: {"content-type": "application/json"},
                    dataType: 'text',
                    data: JSON.stringify(cart),
                    success: function (result) {
                        cartJs = JSON.parse(result);
                        // alert("received=" + result);
                        $("#cart-${status.count}").html("장바구니 제품 개수 : " + cartJs.pdt_qty);
                        $("#cart-sum-${status.count}").html("장바구니 제품 총 가격 : " + cartJs.pdt_qty * ${cart.sel_price});
                    },
                    error: function () {
                        alert("error")
                    }
                });
                // alert("the request is sent")
            });
            $("#minus-test-btn-${status.count}").click(function () {
                let val = $('#cart-qty-${status.count}').val($('#cart-qty-${status.count}').val() - 1);
                let cart = {
                    user_id:${sessionScope.user_id},
                    pdt_id:${cart.pdt_id},
                    pdt_qty: $('#cart-qty-${status.count}').val()
                };
                let cartJs = {};
                $.ajax({
                    type: 'POST',
                    url: '/carts/qty',
                    headers: {"content-type": "application/json"},
                    dataType: 'text',
                    data: JSON.stringify(cart),
                    success: function (result) {
                        cartJs = JSON.parse(result);
                        // alert("received=" + result);
                        $("#cart-${status.count}").html("장바구니 제품 개수 : " + cartJs.pdt_qty);
                        $("#cart-sum-${status.count}").html("장바구니 제품 총 가격 : " + cartJs.pdt_qty * ${cart.sel_price});
                    },
                    error: function () {
                        alert("error")
                    }
                });
                // alert("the request is sent")
            });
        });
    </script>
</c:forEach>
<div id="cart-sum">총 장바구니 가격 : ${sum}</div>
user_id, CT.pdt_id, pdt_qty, image, sel_price, title, stock
<a class="btn" href="/orders">주문하기</a>
</body>
</html>
