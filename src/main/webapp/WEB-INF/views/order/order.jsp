<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage'}"
/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevKurly :: 주문서</title>
    <link rel="stylesheet" type="text/css" href="/cart/reset.css">
    <link rel="stylesheet" type="text/css" href="/order/order.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/footer.css">
    <style>
        #whole_container {
            width: 100%;
            height: 100vh;
        }

        #content_body {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            padding: 0 200 0 200;
        }

        .content {
            width: 400px;
            border: 1px solid #8b00ff;
        }

        button {
            width: 200px;
            height: 100px;
        }

        /* input {
            width: 80%;
        } */
        a {
            text-decoration: none;
        }

        #search_first a {
            font-weight: 600;
        }
    </style>
</head>

<body>
<div id="whole_container">
    <div id="navigation">
        <div id="signup_signin_container">
            <div id="signup_signin">
                <a id="signup" href="${nameLink}">${name}</a>
                <div></div>
                <a id="signin" href="${signInOutLink}">${signInOut}</a>
                <div></div>
                <a id="cust">고객센터</a>
            </div>
        </div>
        <div id="search">
            <div id="search_first">
                <a href="/">
                    <img style="width:82px; height: 42px"
                         src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODIiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCA4MiA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0ibm9uZSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGg4MnY0MkgweiIvPgogICAgICAgIDxwYXRoIGQ9Ik02Mi41Ljk2NWMxLjAyNi0uNTU3IDIuNDY2LS43MTggMy4zNTYuMTA3Ljg5LjgyNS42NzYgMi4wNDggMCAzLjk3MyAwIDAtMS41MDUgNC4wNjYtMy4wNTUgOC4yNjJsLS4zOTggMS4wOGMtMS40MTQgMy44My0yLjc2MiA3LjQ4Ny0yLjkyNyA3Ljk2My0xLjQ5OCA0LjI0NSAxLjk2NyA0LjEyMiA0LjAyNC0uMTUyIDEuMTU5LTIuMzk0IDIuNjQ0LTYuMzU3IDIuNjQ0LTYuMzU3LjUyNC0xLjU2My42ODItMi41MDQuMzU5LTIuODI4LS4xMDctLjExMy4wNDUtLjI1Mi4xOC0uMzIzIDIuMjY5LTEuMTQ5IDQuNjMtLjA3MiAzLjMzNiAzLjMxbC0uMDU0LjEzOGMtLjM4Ny45NzgtMi42OCA2LjczMy0yLjY4IDYuNzMzLS42NzYgMS42Ni0uNTk1IDMuMjM2LjQxOCAzLjIzNi42ODYtLjAwNCAxLjQ2LS4zODUgMi4zMDQtMS4wODggMS44MTgtMS41MDQgMy4yMjItNC4zMTIgMy43MjctNS40NTQuMjMtLjUwOCAxLjA4Ny0yLjQyIDEuNzY2LTQuMzYxLjIzNi0uNjY1LjM2OS0xLjM2LjM5NS0yLjA2NWEuNDQzLjQ0MyAwIDAgMSAuMTk0LS40NTkgMy41NzggMy41NzggMCAwIDEgMS42Ny0uNDIgMS44MDUgMS44MDUgMCAwIDEgMS40NjUuNzA1Yy40NDMuNTk4LjU2NiAxLjU3OS4xMDMgMi44MDgtLjEyLjMyLTMuNzc1IDkuOTU4LTMuNzc1IDkuOTU4di4wMjZjMi4wNDEtMS4yMjMgMy44Ny0xLjMxMyA0Ljk1My0uODU0bC0uMDAzLS4wMTNjMS40OTUuNjQ3IDEuOTkgMi40NC45MzggMy41NTktLjEwMy4xMS0uMzYyLjA4NC0uMzYyLS4wOS0uMDk0LTEuMjUzLTIuNTE3LTMuNDk1LTYuMTA5LTEuMDc1bC0uMTQ1LjM4NS0xLjA2OCAyLjgwOGMtMi42MiA3LjAxOC01LjQwMyAxMi4xMzYtOS40MTUgMTEtMi42ODgtLjc2LTIuMzc3LTQuNjA3LjUxNS03Ljc5YTU0LjkgNTQuOSAwIDAgMSA2LjQ5LTUuODk4Yy4wNjgtLjE4OC4xMy0uMzUuMTg4LS41MTEuMjc4LS43OC40OTEtMS40MzQuNzkyLTIuMjY1bC4xNTktLjUxOGMtLjE3OC4yLS40OTguNTczLS43MTIuODEyLS43MTIuOC0yLjQ5NCAyLjc1Ny01LjMyOSAyLjIwN2wtLjIzNC0uMDUyYy0yLjA1LS41MDgtMi42MDgtMS45ODYtMi42NTUtMy4yNzctMi4xNDIgMi42NTYtNC4zNTEgMy40MjYtNS44MDcgMy4zOS0xLjk0OC0uMDQ4LTMuMzc4LTEuNTE0LTIuNDI3LTQuMjkgMS4wNTgtMy4xMDYgNS41LTE1LjMzMiA2Ljc5NS0xOSAuNDg1LTEuNTguNjY2LTIuNTguMTg0LTIuOTc0LS4xMjMtLjEwMy4wNTItLjI2NS4yLS4zNDZ6bTguMzY0IDI4Ljc3OGMtMS4xMDMuODgtNS41MjYgNC41My02Ljc1MiA3LjQ0MS0uNTA1IDEuMTk3LS4zNzYgMi4xNDkuNDg4IDIuMjMzIDEuOTYuMTk0IDQuMDEyLTMuODE4IDYuMjI4LTkuNTEyek0xNi4wMjggNS4zNTJjLS4wODcuMzMyLTEuMzE5IDMuODYtMi43MDEgNy43NDlsLS4yMDkuNTg2LS4yMS41ODktLjIxNS42MDRjNC42OTEtMS4xMjMgMTMuMDY0LTYuNTcgMTQuMDM1LTEwLjA4NS4xMi0uMTYxLjI5LS4yMi41NjYtLjAzNS40OTUuMzMuNjg2IDEuMTU1LjQ5NSAxLjkxOC0uNzY0IDMuMDM4LTYuNDE2IDcuMzQxLTExLjM3OSA5LjU1NC42MTIgMS42MzcgMi42ODIgNi4yNjcgNC4yMDYgOS4xMTEgMS42NjMgMy4xMTkgMy40MiA0LjU3NSA2LjE0NyA0LjczNyAxLjQ2LjA4NSAzLjAxNC0uNDQ3IDMuODkzLTEuMjJsLjE0OC0uMTQtLjAxMy4wM2MuMTk0LS4yMDQuNTExLjA3Ny4zNjYuMzIzYTYuNSA2LjUgMCAwIDEtNC45OTIgMi44NjdjLTYuMzQ1LjQyNy04Ljc3NC0zLjg3LTEzLjMwNC0xNC40OTQtLjM2Ni4xMjYtLjgwOS4yODgtMS4yNTUuNDUtLjA3NS4xODctMi4wNyA1LjY0Mi0yLjEzIDUuODIzLS45NDQgMi44Ny0xLjAwNSA0LjQ0Mi0uMzU4IDQuODk1LjE0NS4wOS4wNzQuMzMzLS4xNzguNDE0LTIuNTI3Ljc5Ni00Ljg1My0uNjk2LTMuNTU5LTQuNDQyIDEuMTYxLTMuMzE2IDUuNjktMTYuMTggNi45MTQtMTkuNjI2LjQyNy0xLjI5NC4xOTctMi4xMjUtLjQ5Mi0yLjMwNkM4LjUwNiAxLjc4Ljg3NyA4Ljc0OSAxLjk3MSAxNS4xODRjLjE5IDEuMTIuOTggMS43NDcgMS4zNzggMS42NjNhLjEzMy4xMzMgMCAwIDEgLjE1Ni4xNTkgMS41MDggMS41MDggMCAwIDEtMS44NDUgMS4wMzJDLjQ5IDE3Ljc4Mi4xMDcgMTYuNTI3LjA0MyAxNS44OC0uNjAxIDkuMjIgNi4xNDggMS4yMyAxMi4zODkuNThjMi4zNzgtLjI1IDQuNjEuOTYgMy42NCA0Ljc3MnptMjQuMDQgOS45MTMtLjA2LjIwNy0yLjgzIDguMTZjLS4zMDQuODUtLjEgMS43MzcuNTAxIDEuOTAyIDEuNzU3LjQ4MiA0LjAyOC0yLjE0NSA1LjEzMS00LjczM2E2Ny43OTQgNjcuNzk0IDAgMCAwIDEuNDc2LTMuODE1Yy41ODItMS42NDMgMS4xMDYtMy4xODMuNzgzLTMuOTA4LS4wNzUtLjE2OC4wNDUtLjI1Ni4yMjMtLjM1LjUwNS0uMjU1IDIuMjI2LS44MjUgMy4xNDEuMDY4LjY5NS42NzQuNjA5IDEuNzcxLS4wMyAzLjQzN2wtLjA5Ni4yNDIuMjItLjI3M2MyLjcwMy0zLjMgNC43OTItNC4yOTIgNi41NjMtMy41OTdsLjE0Ny4wNjJjMi4zODEgMS4wNzQgMS4xNDYgNS4yMTUtMi4xMTYgNS40OC0uMi4wMTctLjM1Ni0uMTI2LS4xNTgtLjQwNy4zOTUtLjYwNS4zNTYtMS45MDktLjc5Ni0yLjAyMi0xLjE1Mi0uMTEzLTIuODMgMS4yMDctNC4wMzggMi44NDQtMS4wODQgMS40NS0yLjIgMy45MTEtMy4zMjIgNy4yNzMtLjI3Mi44MTgtLjE0MyAxLjAxMi0uMTEgMS4wNjdhLjEuMSAwIDAgMSAwIC4wOTRjLS4xNDMuMjcyLS45NjUuNTk2LTEuNzYuNTk2LTEuNjI1LS4wMDctMi4yOTEtLjk0NS0xLjk2Ny0yLjQzNy0xLjg0OCAxLjc2NC0zLjcxMSAyLjYxNC01LjM1NSAyLjQ2NmEyLjUyNCAyLjUyNCAwIDAgMS0yLjIzNi0zLjEwM2MtMS40MjYgMS44MDktMy41NDIgMy4yNjgtNS42OTcgMy4wNjctMi4xNTUtLjItMy41LTEuNjY2LTIuODAyLTQuNzg4LjU5LTIuNTk4IDEuNTkyLTUuMjkgMi4yMDctNy4wMjcuNTE0LTEuNDU2LjYxOC0yLjQwNy4yOTQtMi43NS0uMTAzLS4xMTQuMDU1LS4yNS4xOTQtLjMyNCAxLjY5LS44ODYgNC4zOTQtLjMxNCAzLjYzIDIuMDktLjgwMiAyLjUyNy0yLjI1NSA2LjQ5LTIuNTUgNy40LS43MzcgMi4yODctLjI5IDMuNTIzLjc1NSAzLjU4IDEuMDQ1LjA2IDIuNDMtLjk2IDMuNDItMi41MDMgMS43Ni0yLjUyNCAyLjU4MS01LjY4NSAzLjM3Ny03Ljg4Mi4yMDQtLjU2LjUyNy0xLjg2Ni4xODUtMi4zNTItLjA5MS0uMTIzLjA2Ny0uMjU4LjI3NS0uMzcyIDEuNTM3LS44NDkgNC4yODUtLjY0IDMuNDAyIDIuNjA4eiIgZmlsbD0iIzVGMDA4MCIvPgogICAgPC9nPgo8L3N2Zz4K"
                         alt="logo"/>
                </a>
                <a href="/">마켓컬리</a>
                <div></div>
                <a href="/">뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요"/>
                <img src="/cart/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <img src="/cart/imgs/location.png"/>
                <img src="/cart/imgs/heart.png"/>
                <a href="/carts/"><img src="/cart/imgs/shopping-cart.png"/></a>
            </div>
        </div>
        <div id="menubar">
            <div id="category_container">
                <img src=""/>
                <p style="width: 80px;" id="show_category_button">카테고리</p>
            </div>
            <div id="menus">
                <a href="/product/newlist?sort=1&page=1&pageSize=12&order_sc=in_date">신상품</a>
                <a href="/product/newlist?sort=2&page=1&pageSize=12&order_sc=sales_rate">베스트</a>
                <a href="/product/newlist?sort=3&page=1&pageSize=12">알뜰쇼핑</a>
                <a href="/event/main">특가/혜택</a>
            </div>
            <div id="deli_info">
                <span id="purple_deli_info">샛별·낮</span>
                <span id="gray_deli_info">배송안내</span>
            </div>
        </div>
    </div>
    <div id="cat_wrapper">
        <div id="main_cat_container">
            <%--            <li class="cat main_cat">채소</li>--%>
        </div>
        <div id="sub_cat_container">
            <%--            <li class="cat sub_cat">채소</li>--%>
        </div>
    </div>
    <%--    header--%>
    <div id="content">
        <h2>주문서</h2>
        <form id="form" action="/payments/${order_id}" method="post" autocomplete="off">
            <%--        -----%>
            <div id="container">
                <div id="product_list">
                    <h4 class="product_type">주문 상품</h4>
                    <div class="products_container">
                        <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                        <div id="order"></div>
                        <c:forEach var="cart" items="${cart}" varStatus="status">
                            <div class="product">
                                <img src="${cart.image}"
                                     alt="" class="product_img"/>
                                <h4>[${cart.company}] ${cart.title}</h4>
                                <div class="quantity_control_box">
                                    <div id="order-qty">${cart.pdt_qty} 개</div>
                                </div>
                                <p id="order-sum" style="margin-bottom: 0px;padding-left: 60px;">
                                    <fmt:formatNumber value="${cart.sel_price * cart.pdt_qty}" pattern="###,###"/>원</p>
                            </div>
                        </c:forEach>
                    </div>
                    <h4 class="product_type">주문자 정보</h4>
                    <div class="products_container">
                        <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                        <div id="user-info"></div>
                    </div>
                    <h4 class="product_type">배송 정보</h4>
                    <div class="products_container">
                        <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                        <div id="address"></div>
                    </div>
                    <h4 class="product_type">쿠폰 / 적립금</h4>
                    <div class="products_container">
                        <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                        <div id="coupon"></div>
                        <div class="payment_row">
                            <span style="margin-top: 15px;">쿠폰 적용</span>
                            <span>
                            <label>
                                <select class="coupon-select" id="coupon-select" name='coupn_id'>
                                    <option data-coupon="0" value='0'>사용가능 쿠폰 0 장 / 전체 0 장</option>
                                </select>
                            </label>
                        </span>
                        </div>
                        <div style="padding-top: 20px;" class="payment_row">
                            <span style="margin-top: 30px;">보유한 적립금</span>
                            <span id="point-text" style="padding-top: 25px; padding-left: 300px;">0원</span>
                            <span><a id="point-btn">모두사용</a></span>
                        </div>
                        <div style="padding-top: 20px;" class="payment_row">
                            <span style="margin-top: 25px;">사용할 적립금</span>
                            <span style="margin-top: 15px;"><input id="point-input" name="used_acamt" type="number" max="0" min="0"
                                                                   value="0"
                                                                   placeholder="0" style="text-align: right"></span>
                        </div>
                    </div>
                    <h4 class="product_type">결제 수단</h4>
                    <div class="products_container">
                        <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                        <div id="payment-way"></div>
                        <%--                    -----%>
                        <div class="payment_row">
                            <span>결제수단 선택</span>
                            <span id="remember-payment-select" style="display: flex">
                                <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzRFN0E1MSIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4="
                                     alt="" id="remember-payment-checked" class="remember-payment-checked"/>
                                <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                                     alt="" id="remember-payment-unchecked" class="remember-payment-unchecked"
                                     style="display: none"/>
                                <label class="remember-payment" style="margin-top: 5px;margin-left: 5px;">
                                    <input type="checkbox"
                                           id="remember-payment"
                                           name="remember-payment" ${empty cookie.email.value ? "" : "checked"} hidden>선택한 결제
                                    수단을 다음에도 사용</label>
                            </span>
                        </div>
                        <div class="payment_row">
                            <span></span>
                            <span>
                                <div class="payment-container">
                            <div style="display: flex;" class="select-payment">
                                <input type="text" id="payment" name="setl_cd" value="credit" hidden/>
                                <input
                                        type="radio"
                                        id="credit"
                                        name="payment"
                                        checked
                                        onclick="document.querySelector('#payment').value = 'credit'"
                                /><label class="payment" for="credit">신용카드</label>
                                <input
                                        type="radio"
                                        id="pay"
                                        name="payment"
                                        onclick="document.querySelector('#payment').value = 'pay'"
                                /><label class="payment" for="pay">간편 결제</label>
                                <input
                                        type="radio"
                                        id="phone"
                                        name="payment"
                                        onclick="document.querySelector('#payment').value = 'phone'"
                                /><label class="payment" for="phone">휴대폰</label>
                            </div>
                            <div id="below-div"></div>
                        </div>
                            </span>
                        </div>
                    </div>
                </div>
                <div style="width: 284px;padding-left: 10px;">
                    <div id="shipping">
                        <h4 style="font-weight: 500; font-size: 24px">결제 금액</h4>
                    </div>
                    <div id="shipping_payment">
                        <div id="payment_box" style="height: 290px;">
                            <div style="padding: 20px">
                                <div class="payment_row">
                                    <span>주문금액</span>
                                    <span id="order_price">0 원</span>
                                </div>
                                <div class="payment_row" style="font-size: 14px; color: #C5C5C5;">
                                    <span>ㄴ 상품금액</span>
                                    <span id="product_price">0 원</span>
                                </div>
                                <div class="payment_row" style="font-size: 14px; color: #C5C5C5;">
                                    <span>ㄴ 상품할인금액</span>
                                    <span id="discount_price">0 원</span>
                                </div>
                                <div class="payment_row">
                                    <span>배송비</span>
                                    <span>0 원</span>
                                </div>
                                <div class="payment_row">
                                    <span>쿠폰할인</span>
                                    <span id="coupon_price">0 원</span>
                                </div>
                                <div class="payment_row">
                                    <span>적립금사용</span>
                                    <span id="point_price">0 원</span>
                                </div>
                                <div class="payment_row total">
                                    <span>최종결제금액</span>
                                    <span id="payment_price" style="font-weight: bold; font-size: 22px;">0 원</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="checked" id="checked" value=""/>
                    <input type="number" name="all_amt" id="all_amt" min="0" value="${sum}" hidden>
                    <button id="order_submit" type="submit" style="cursor: pointer; font-weight: 500; font-size: 16px;">
                        0 원 결제하기
                    </button>
                </div>
            </div>
        </form>
    </div>
    <footer>
        <img src="/logo.svg" alt="logo">
        <div id="member_container">
            <a href="https://github.com/dr94406">
                <p class="mem_row"><img src="/githubLogo.png">김형민</p>
            </a>
            <a href="https://github.com/PGRRR">
                <p class="mem_row"><img src="/githubLogo.png">이선우</p>
            </a>
            <a href="https://github.com/Riiver-J">
                <p class="mem_row"><img src="/githubLogo.png">정여경</p>
            </a>
            <a href="https://github.com/narlae">
                <p class="mem_row"><img src="/githubLogo.png">김영준</p>
            </a>
            <a href="https://github.com/xpmxf4">
                <p class="mem_row"><img src="/githubLogo.png">박채훈</p>
            </a>
            <a href="https://github.com/didqksrla">
                <p class="mem_row"><img src="/githubLogo.png">김경빈</p>
            </a>
        </div>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/category/js/category.js"></script>
<script>
    $('#order_submit').click(function () {
        $(this).prop('disabled', true).css('cursor', 'wait').css('background-color', '#DDDDDD').text('결제 대기중 입니다');
        $('#form').submit();
    });

    $('#order_submit').html((${sum}).toLocaleString('en-US') + ' 원 결제하기');
    $('#product_price').html((${pdtSum}).toLocaleString('en-US') + ' 원');
    $('#discount_price').html((${sum - pdtSum}).toLocaleString('en-US') + ' 원');
    $('#payment_price').html((${sum}).toLocaleString('en-US') + ' 원');
    $('#order_price').html((${sum}).toLocaleString('en-US') + ' 원');

    $('input:checkbox').prop('checked', true);
    $('.remember-payment-checked').css('display', '')
    $('.remember-payment-unchecked').css('display', 'none')
    $('#remember-payment-select').click(function () {
        if ($('#remember-payment').is(':checked')) {
            $('#remember-payment').prop('checked', false);
            $('#remember-payment-checked').css('display', 'none');
            $('#remember-payment-unchecked').css('display', '');
        } else {
            $('#remember-payment').prop('checked', true);
            $('#remember-payment-checked').css('display', '');
            $('#remember-payment-unchecked').css('display', 'none');
        }
    })
    $(document).ready(function () {
        let credit =
            `<div>
                <select class="credit-select" name='credit'>
                    <option value=''>카드를 선택해주세요</option>
                    <option value='현대'>현대</option>
                    <option value='신한'>신한</option>
                    <option value='비씨'>비씨</option>
                    <option value='KB국민'>KB국민</option>
                </select>
                <select class="credit-select" name='installment'>
                    <option value=''>할부를 선택해주세요</option>
                    <option value='일시불'>일시불</option>
                    <option value='2개월'>2개월</option>
                    <option value='4개월'>4개월</option>
                    <option value='6개월'>6개월</option>
                </select>
            </div>`;
        let pay =
            `
                <div style="display: flex; justify-content: center">
                    <label class="container" for="kurly-pay">컬리페이
                        <input type="radio" id="kurly-pay" name="payment-pay" checked="checked">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container" for="naver-pay">네이버페이
                        <input type="radio" id="naver-pay" name="payment-pay">
                        <span class="checkmark"></span>
                    </label>
                </div>`;
        $('#below-div').html(credit);
        $(".payment").click(function () {
            let now = this.innerText;
            if (now === '신용카드') {
                $('#below-div').html(credit);
            } else if (now === '간편 결제') {
                $('#below-div').html(pay);
            } else {
                $('#below-div').html('');
            }
        });
    });
    $(document).ready(function () {

        /**
         * 쿠폰 요청
         */
        $.ajax({
            type: 'GET',
            url: '/orders/coupon',
            datatype: 'json',
            success: function (result) {
                $.each(result, function (index, CouponDto) {
                    let coupon =
                        `
                        <option class='coupon-option' data-coupon='` + CouponDto.value + `' value='` + CouponDto.coupn_id + `'>` + CouponDto.nm + `</option>
                        `;
                    $('#coupon-select').append(coupon);
                })
            },
            error: function () {
                alert('쿠폰이 없습니다.')
                location.href = '/mypage';
            }
        });

        /**
         * 회원 정보 요청
         */
        $.ajax({
            type: 'GET',
            url: '/orders/userinfo',
            datatype: 'json',
            success: function (result) {
                let maxPnt;
                if ($('#all_amt').val() < result.pnt) {
                    maxPnt = parseInt($('#all_amt').val());
                } else {
                    maxPnt = result.pnt;
                }

                $('#point-input').prop('max', maxPnt);
                $('#point-text').html((result.pnt).toLocaleString() + ' 원');
                $('#point-btn').click(function () {
                    $('#point-input').val(maxPnt);
                    $('#point_price').html((-maxPnt).toLocaleString() + ' 원').css('color', '#FA7E54');
                    $('#all_amt').val(${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon'));
                    $('#payment_price').html((${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon')).toLocaleString() + ' 원');
                    $('#order_submit').html((${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon')).toLocaleString() + ' 원 결제하기');
                    if (${sum} -$('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon') < 0) {
                        $("#coupon-select").val("0").prop("selected", true);
                        $('#coupon_price').html((0).toLocaleString() + ' 원').css('color', '#FA7E54');
                        $('#point-input').val(0);
                        $('#point_price').html((0).toLocaleString() + ' 원').css('color', '#FA7E54');
                        $('#all_amt').val(${sum});
                        $('#payment_price').html((${sum}).toLocaleString() + ' 원');
                        $('#order_submit').html((${sum}).toLocaleString() + ' 원 결제하기');
                        alert('할인 금액이 결제 금액보다 클 수 없습니다.');
                    }
                });
                $('#point-input').change(function () {
                    if ($(this).prop('type') !== 'number') {
                        $(this).prop('type', 'number');
                        $(this).val(0);
                    }
                    if ($(this).val() < 0) {
                        $(this).val(0);
                    } else if ($(this).val() > maxPnt) {
                        $(this).val(maxPnt);
                    }
                    $('#point_price').html((-$('#point-input').val()).toLocaleString() + ' 원').css('color', '#FA7E54');
                    $('#all_amt').val(${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon'));
                    $('#payment_price').html((${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon')).toLocaleString() + ' 원');
                    $('#order_submit').html((${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon')).toLocaleString() + ' 원 결제하기');
                    if (${sum} -$('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon') < 0) {
                        $("#coupon-select").val("0").prop("selected", true);
                        $('#coupon_price').html((0).toLocaleString() + ' 원').css('color', '#FA7E54');
                        $('#point-input').val(0);
                        $('#point_price').html((0).toLocaleString() + ' 원').css('color', '#FA7E54');
                        $('#all_amt').val(${sum});
                        $('#payment_price').html((${sum}).toLocaleString() + ' 원');
                        $('#order_submit').html((${sum}).toLocaleString() + ' 원 결제하기');
                        alert('할인 금액이 결제 금액보다 클 수 없습니다.');
                    }
                });
                $('#coupon-select').change(function () {
                    $('#coupon_price').html((-$("#coupon-select option:selected").attr('data-coupon')).toLocaleString() + ' 원').css('color', '#FA7E54');
                    $('#all_amt').val(${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon'));
                    $('#payment_price').html((${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon')).toLocaleString() + ' 원');
                    $('#order_submit').html((${sum} - $('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon')).toLocaleString() + ' 원 결제하기');
                    if (${sum} -$('#point-input').val() - $("#coupon-select option:selected").attr('data-coupon') < 0) {
                        $("#coupon-select").val("0").prop("selected", true);
                        $('#coupon_price').html((0).toLocaleString() + ' 원').css('color', '#FA7E54');
                        $('#point-input').val(0);
                        $('#point_price').html((0).toLocaleString() + ' 원').css('color', '#FA7E54');
                        $('#all_amt').val(${sum});
                        $('#payment_price').html((${sum}).toLocaleString() + ' 원');
                        $('#order_submit').html((${sum}).toLocaleString() + ' 원 결제하기');
                        alert('할인 금액이 결제 금액보다 클 수 없습니다.');
                    }
                });
                let user =
                    `
                        <div class="payment_row">
                            <span>보내시는 분</span>
                            <span>` + result.user_nm + `</span>
                        </div>
                        <div class="payment_row">
                            <span>휴대폰</span>
                            <span>` + result.telno.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`) + `</span>
                        </div>
                        <div class="payment_row">
                            <span>이메일</span>
                            <span>` + result.user_email + `</span>
                        </div>
                        `;
                $('#user-info').append(user);
            },
            error: function () {
                alert('회원 정보를 입력 해주세요.')
                location.href = '/mypage';
            }
        });

        /**
         * 배송지 정보 요청
         */
        $.ajax({
            type: 'GET',
            url: '/orders/address',
            datatype: 'json',
            success: function (result) {
                let user =
                    `
                        <div class="payment_row">
                            <span>배송지</span>
                            <span>` + result.main_addr + ` ` + result.sub_addr + `</span>
                        </div>
                        <div class="payment_row">
                            <span>상세 정보</span>
                            <span>` + result.addr_name + `, ` + result.addr_tel.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`) + `</span>
                        </div>
                        <input type="text" name="addr_id" value="` + result.addr_id + `" hidden/>
                        `;
                $('#address').append(user);
            },
            error: function () {
                alert('배송지를 등록해 주세요');
                location.href = '/address/list';
            }
        });
    });
</script>
</body>
</html>