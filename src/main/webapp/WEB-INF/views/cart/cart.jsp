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
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage'}"
/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevKurly :: 장바구니</title>
    <link rel="stylesheet" type="text/css" href="/cart/reset.css">
    <link rel="stylesheet" type="text/css" href="/cart/cart.css">
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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
                <img style="width:82px; height: 42px"
                     src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODIiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCA4MiA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0ibm9uZSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGg4MnY0MkgweiIvPgogICAgICAgIDxwYXRoIGQ9Ik02Mi41Ljk2NWMxLjAyNi0uNTU3IDIuNDY2LS43MTggMy4zNTYuMTA3Ljg5LjgyNS42NzYgMi4wNDggMCAzLjk3MyAwIDAtMS41MDUgNC4wNjYtMy4wNTUgOC4yNjJsLS4zOTggMS4wOGMtMS40MTQgMy44My0yLjc2MiA3LjQ4Ny0yLjkyNyA3Ljk2My0xLjQ5OCA0LjI0NSAxLjk2NyA0LjEyMiA0LjAyNC0uMTUyIDEuMTU5LTIuMzk0IDIuNjQ0LTYuMzU3IDIuNjQ0LTYuMzU3LjUyNC0xLjU2My42ODItMi41MDQuMzU5LTIuODI4LS4xMDctLjExMy4wNDUtLjI1Mi4xOC0uMzIzIDIuMjY5LTEuMTQ5IDQuNjMtLjA3MiAzLjMzNiAzLjMxbC0uMDU0LjEzOGMtLjM4Ny45NzgtMi42OCA2LjczMy0yLjY4IDYuNzMzLS42NzYgMS42Ni0uNTk1IDMuMjM2LjQxOCAzLjIzNi42ODYtLjAwNCAxLjQ2LS4zODUgMi4zMDQtMS4wODggMS44MTgtMS41MDQgMy4yMjItNC4zMTIgMy43MjctNS40NTQuMjMtLjUwOCAxLjA4Ny0yLjQyIDEuNzY2LTQuMzYxLjIzNi0uNjY1LjM2OS0xLjM2LjM5NS0yLjA2NWEuNDQzLjQ0MyAwIDAgMSAuMTk0LS40NTkgMy41NzggMy41NzggMCAwIDEgMS42Ny0uNDIgMS44MDUgMS44MDUgMCAwIDEgMS40NjUuNzA1Yy40NDMuNTk4LjU2NiAxLjU3OS4xMDMgMi44MDgtLjEyLjMyLTMuNzc1IDkuOTU4LTMuNzc1IDkuOTU4di4wMjZjMi4wNDEtMS4yMjMgMy44Ny0xLjMxMyA0Ljk1My0uODU0bC0uMDAzLS4wMTNjMS40OTUuNjQ3IDEuOTkgMi40NC45MzggMy41NTktLjEwMy4xMS0uMzYyLjA4NC0uMzYyLS4wOS0uMDk0LTEuMjUzLTIuNTE3LTMuNDk1LTYuMTA5LTEuMDc1bC0uMTQ1LjM4NS0xLjA2OCAyLjgwOGMtMi42MiA3LjAxOC01LjQwMyAxMi4xMzYtOS40MTUgMTEtMi42ODgtLjc2LTIuMzc3LTQuNjA3LjUxNS03Ljc5YTU0LjkgNTQuOSAwIDAgMSA2LjQ5LTUuODk4Yy4wNjgtLjE4OC4xMy0uMzUuMTg4LS41MTEuMjc4LS43OC40OTEtMS40MzQuNzkyLTIuMjY1bC4xNTktLjUxOGMtLjE3OC4yLS40OTguNTczLS43MTIuODEyLS43MTIuOC0yLjQ5NCAyLjc1Ny01LjMyOSAyLjIwN2wtLjIzNC0uMDUyYy0yLjA1LS41MDgtMi42MDgtMS45ODYtMi42NTUtMy4yNzctMi4xNDIgMi42NTYtNC4zNTEgMy40MjYtNS44MDcgMy4zOS0xLjk0OC0uMDQ4LTMuMzc4LTEuNTE0LTIuNDI3LTQuMjkgMS4wNTgtMy4xMDYgNS41LTE1LjMzMiA2Ljc5NS0xOSAuNDg1LTEuNTguNjY2LTIuNTguMTg0LTIuOTc0LS4xMjMtLjEwMy4wNTItLjI2NS4yLS4zNDZ6bTguMzY0IDI4Ljc3OGMtMS4xMDMuODgtNS41MjYgNC41My02Ljc1MiA3LjQ0MS0uNTA1IDEuMTk3LS4zNzYgMi4xNDkuNDg4IDIuMjMzIDEuOTYuMTk0IDQuMDEyLTMuODE4IDYuMjI4LTkuNTEyek0xNi4wMjggNS4zNTJjLS4wODcuMzMyLTEuMzE5IDMuODYtMi43MDEgNy43NDlsLS4yMDkuNTg2LS4yMS41ODktLjIxNS42MDRjNC42OTEtMS4xMjMgMTMuMDY0LTYuNTcgMTQuMDM1LTEwLjA4NS4xMi0uMTYxLjI5LS4yMi41NjYtLjAzNS40OTUuMzMuNjg2IDEuMTU1LjQ5NSAxLjkxOC0uNzY0IDMuMDM4LTYuNDE2IDcuMzQxLTExLjM3OSA5LjU1NC42MTIgMS42MzcgMi42ODIgNi4yNjcgNC4yMDYgOS4xMTEgMS42NjMgMy4xMTkgMy40MiA0LjU3NSA2LjE0NyA0LjczNyAxLjQ2LjA4NSAzLjAxNC0uNDQ3IDMuODkzLTEuMjJsLjE0OC0uMTQtLjAxMy4wM2MuMTk0LS4yMDQuNTExLjA3Ny4zNjYuMzIzYTYuNSA2LjUgMCAwIDEtNC45OTIgMi44NjdjLTYuMzQ1LjQyNy04Ljc3NC0zLjg3LTEzLjMwNC0xNC40OTQtLjM2Ni4xMjYtLjgwOS4yODgtMS4yNTUuNDUtLjA3NS4xODctMi4wNyA1LjY0Mi0yLjEzIDUuODIzLS45NDQgMi44Ny0xLjAwNSA0LjQ0Mi0uMzU4IDQuODk1LjE0NS4wOS4wNzQuMzMzLS4xNzguNDE0LTIuNTI3Ljc5Ni00Ljg1My0uNjk2LTMuNTU5LTQuNDQyIDEuMTYxLTMuMzE2IDUuNjktMTYuMTggNi45MTQtMTkuNjI2LjQyNy0xLjI5NC4xOTctMi4xMjUtLjQ5Mi0yLjMwNkM4LjUwNiAxLjc4Ljg3NyA4Ljc0OSAxLjk3MSAxNS4xODRjLjE5IDEuMTIuOTggMS43NDcgMS4zNzggMS42NjNhLjEzMy4xMzMgMCAwIDEgLjE1Ni4xNTkgMS41MDggMS41MDggMCAwIDEtMS44NDUgMS4wMzJDLjQ5IDE3Ljc4Mi4xMDcgMTYuNTI3LjA0MyAxNS44OC0uNjAxIDkuMjIgNi4xNDggMS4yMyAxMi4zODkuNThjMi4zNzgtLjI1IDQuNjEuOTYgMy42NCA0Ljc3MnptMjQuMDQgOS45MTMtLjA2LjIwNy0yLjgzIDguMTZjLS4zMDQuODUtLjEgMS43MzcuNTAxIDEuOTAyIDEuNzU3LjQ4MiA0LjAyOC0yLjE0NSA1LjEzMS00LjczM2E2Ny43OTQgNjcuNzk0IDAgMCAwIDEuNDc2LTMuODE1Yy41ODItMS42NDMgMS4xMDYtMy4xODMuNzgzLTMuOTA4LS4wNzUtLjE2OC4wNDUtLjI1Ni4yMjMtLjM1LjUwNS0uMjU1IDIuMjI2LS44MjUgMy4xNDEuMDY4LjY5NS42NzQuNjA5IDEuNzcxLS4wMyAzLjQzN2wtLjA5Ni4yNDIuMjItLjI3M2MyLjcwMy0zLjMgNC43OTItNC4yOTIgNi41NjMtMy41OTdsLjE0Ny4wNjJjMi4zODEgMS4wNzQgMS4xNDYgNS4yMTUtMi4xMTYgNS40OC0uMi4wMTctLjM1Ni0uMTI2LS4xNTgtLjQwNy4zOTUtLjYwNS4zNTYtMS45MDktLjc5Ni0yLjAyMi0xLjE1Mi0uMTEzLTIuODMgMS4yMDctNC4wMzggMi44NDQtMS4wODQgMS40NS0yLjIgMy45MTEtMy4zMjIgNy4yNzMtLjI3Mi44MTgtLjE0MyAxLjAxMi0uMTEgMS4wNjdhLjEuMSAwIDAgMSAwIC4wOTRjLS4xNDMuMjcyLS45NjUuNTk2LTEuNzYuNTk2LTEuNjI1LS4wMDctMi4yOTEtLjk0NS0xLjk2Ny0yLjQzNy0xLjg0OCAxLjc2NC0zLjcxMSAyLjYxNC01LjM1NSAyLjQ2NmEyLjUyNCAyLjUyNCAwIDAgMS0yLjIzNi0zLjEwM2MtMS40MjYgMS44MDktMy41NDIgMy4yNjgtNS42OTcgMy4wNjctMi4xNTUtLjItMy41LTEuNjY2LTIuODAyLTQuNzg4LjU5LTIuNTk4IDEuNTkyLTUuMjkgMi4yMDctNy4wMjcuNTE0LTEuNDU2LjYxOC0yLjQwNy4yOTQtMi43NS0uMTAzLS4xMTQuMDU1LS4yNS4xOTQtLjMyNCAxLjY5LS44ODYgNC4zOTQtLjMxNCAzLjYzIDIuMDktLjgwMiAyLjUyNy0yLjI1NSA2LjQ5LTIuNTUgNy40LS43MzcgMi4yODctLjI5IDMuNTIzLjc1NSAzLjU4IDEuMDQ1LjA2IDIuNDMtLjk2IDMuNDItMi41MDMgMS43Ni0yLjUyNCAyLjU4MS01LjY4NSAzLjM3Ny03Ljg4Mi4yMDQtLjU2LjUyNy0xLjg2Ni4xODUtMi4zNTItLjA5MS0uMTIzLjA2Ny0uMjU4LjI3NS0uMzcyIDEuNTM3LS44NDkgNC4yODUtLjY0IDMuNDAyIDIuNjA4eiIgZmlsbD0iIzVGMDA4MCIvPgogICAgPC9nPgo8L3N2Zz4K"
                     alt="logo"/>
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
                <span>신상품</span>
                <span>베스트</span>
                <span>알뜰쇼핑</span>
                <span>특가/혜택</span>
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
        <h2>장바구니</h2>
        <div id="container">
            <div id="product_list">
                <div class="select_or_delete">
                    <span id="select_all" style="display: flex;">
                    <img id="select_all_checked"
                         src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                         alt=""/>
                    <img id="select_all_unchecked"
                         src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                         alt="" style="display: none"/>
                    <span style="padding-top: 5px;">전체선택</span>
                        <input type="checkbox" id="allCheck" checked hidden>
                    </span>
                    <span class="select_contour"></span>
                    <span>선택삭제</span>
                </div>
                <div class="products_container">
                    <h4 class="product_type">냉장 상품</h4>
                    <div id="cart-empty" style="margin-left: 230px; margin-top: 50px; font-size: 16px;">
                        장바구니에 담긴 상품이 없습니다
                    </div>
                    <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                    <div id="cart"></div>
                </div>

            </div>
            <div style="width: 284px;">
                <div id="shipping_payment">
                    <div id="shipping">
                        <h4>배송지</h4>
                        <p>서울 중구 서소문로 89-20 (삼정 아트테라스 정동) 지하2층</p>
                        <p id="is_star_deli">샛별배송</p>
                        <button>배송지 변경</button>
                    </div>
                    <div id="payment_box">
                        <div style="padding: 20px">
                            <div class="payment_row">
                                <span>상품금액</span>
                                <span id="product_price">0원</span>
                            </div>
                            <div class="payment_row">
                                <span>상품할인금액</span>
                                <span id="discount_price">0원</span>
                            </div>
                            <div class="payment_row">
                                <span>배송비</span>
                                <span>0원</span>
                            </div>
                            <div class="payment_row total">
                                <span>결제예정금액</span>
                                <span id="payment_price">0원</span>
                            </div>
                        </div>
                    </div>
                </div>
                <form id="form" action="/orders" method="get" autocomplete="off">
                    <input type="hidden" name="checked" id="checked" value=""/>
                    <button id="order_submit" type="submit" style="cursor: pointer">
                        주문하기
                    </button>
                </form>
            </div>
        </div>
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
<script>
    /**
     * 카테고리
     */
    let wrapper = $("#cat_wrapper");
    let show_category_button = $("#show_category_button");
    let main_cat_container = $("#main_cat_container");
    let sub_cat_container = $("#sub_cat_container");
    let sub_cat = $(".sub_cat");

    show_category_button.hover(() => {
        main_cat_container.show();
    })

    wrapper.mouseleave(() => {
        main_cat_container.hide();
        sub_cat_container.hide();
    })

    sub_cat_container.mouseleave(() => {
        sub_cat_container.hide();
    })

    let catToLi = function(res) {
        let tmp = '';

        res.forEach(el => {
            tmp += '<a href="/product/newlist?cd_name_num='+el.cd_name_num+'&page=1&pageSize=12"<li class="cat main_cat">'+el.cd_name+'</li></a>'
        })

        return tmp;
    }

    let categories = null;

    $(document).ready(function () {

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/product/categories',  // 요청 URI
            success: function (res) {
                categories = res;

                $.each(res, (el) => {
                    $("#main_cat_container").append('<a href="/product/newlist?cd_type_name=' + el + '&page=1&pageSize=12"<li class="cat main_cat">' + el + '</li></a>');
                })
            },
            error: function (result) {
                alert("쿠폰 불러오기 실패");
            }, // 에러가 발생했을 때, 호출될 함수
            complete: function () {
                $(".main_cat").mouseenter((e) => {
                    sub_cat_container.show();
                    sub_cat_container.html(catToLi(categories[e.currentTarget.innerText]));
                })
            }
        })
    });
</script>
<script>
    $("#order_submit").click(function () {

        $(this).prop('disabled', true);

        let checkArr = [];

        $("input[class='checked-cart']:checked").each(function () {
            checkArr.push($(this).attr("data-pdt-id"));
        });
        console.log(checkArr);
        $("#checked").val(checkArr);

        $('#form').submit();
    });
    String.prototype.insertAt = function (index, str) {
        return this.slice(0, index) + str + this.slice(index)
    }

    $(document).ready(function () {

        $.ajax({
            type: 'GET',
            url: '/carts/view',
            datatype: 'json',
            success: function (result) {
                $.each(result, function (index, CartResponseDto) {
                    let cart =
                        `
                        <div class="product">
                        <input type="checkbox" id="checked-cart-` + CartResponseDto.pdt_id + `" class="checked-cart" data-pdt-id="` + CartResponseDto.pdt_id + `" hidden>
                        <span id="cart-select-` + CartResponseDto.pdt_id + `">
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                             alt="" id="cart-checked-` + CartResponseDto.pdt_id + `" class="cart-checked"/>
                        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                             alt="" id="cart-unchecked-` + CartResponseDto.pdt_id + `" class="cart-unchecked" style="display: none"/>
                        </span>
                        <img src="` + CartResponseDto.image + `"
                             alt="" class="product_img"/>
                        <h4>[` + CartResponseDto.company + `] ` + CartResponseDto.title + `</h4>
                        <div class="quantity_control_box">
                            <button id="minus-btn-` + index + `">-</button>
                            <div id="cart-qty-` + index + `">` + CartResponseDto.pdt_qty + `</div>
                            <button id="plus-btn-` + index + `">+</button>
                        </div>
                        <div class="cart-sum" id="cart-sum-hidden-` + CartResponseDto.pdt_id + `" data-status="1" hidden>` + CartResponseDto.pdt_qty * CartResponseDto.sel_price + `</div>
                        <div class="cart-sum-pdt" id="cart-sum-pdt-hidden-` + CartResponseDto.pdt_id + `" data-status="1" hidden>` + CartResponseDto.pdt_qty * CartResponseDto.price + `</div>
                        <p id="cart-sum-` + index + `" style="margin-bottom: 0px;
                            ">` + (CartResponseDto.pdt_qty * CartResponseDto.sel_price).toLocaleString('en-US') + `원</p>
                        <a href="/carts/delete/` + CartResponseDto.pdt_id + `"><button style="
                            margin-bottom: 5px; color: #cacaca; font-size: 16px">x</button></a>
                        </div>
                        `;
                    $('#cart-empty').html('');
                    $('#cart').append(cart);

                    function total() {
                        let sum = 0;
                        $('.cart-sum').each(function () {
                            if ($(this).attr('data-status') === '1') {
                                sum += parseInt($(this).text());
                            }
                        });
                        return sum;
                    }

                    function totalPdt() {
                        let sum = 0;
                        $('.cart-sum-pdt').each(function () {
                            if ($(this).attr('data-status') === '1') {
                                sum += parseInt($(this).text());
                            }
                        });
                        return sum;
                    }

                    $('#select_all').click(function () {
                        if ($('#allCheck').is(':checked')) {
                            $('input:checkbox').prop('checked', false);
                            $('#select_all_checked').css('display', 'none');
                            $('#select_all_unchecked').css('display', '');
                            $('.cart-checked').css('display', 'none')
                            $('.cart-unchecked').css('display', '')
                            $('.cart-sum').attr('data-status', '0');
                            $('.cart-sum-pdt').attr('data-status', '0');
                            $('#order_submit').css('background-color', '#DDDDDD');
                            $('#order_submit').attr('disabled', true);
                            $('#order_submit').text('상품을 선택해주세요');
                            $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                            $('#payment_price').html(total().toLocaleString('en-US') + '원');
                            $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        } else {
                            $('input:checkbox').prop('checked', true);
                            $('#select_all_checked').css('display', '');
                            $('#select_all_unchecked').css('display', 'none');
                            $('.cart-checked').css('display', '')
                            $('.cart-unchecked').css('display', 'none')
                            $('.cart-sum').attr('data-status', '1');
                            $('.cart-sum-pdt').attr('data-status', '1');
                            $('#order_submit').css('background-color', '#5F0080');
                            $('#order_submit').attr('disabled', false);
                            $('#order_submit').text('주문하기');
                            $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                            $('#payment_price').html(total().toLocaleString('en-US') + '원');
                            $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        }
                    });

                    $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                    $('#payment_price').html(total().toLocaleString('en-US') + '원');
                    $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                    $('input:checkbox').prop('checked', true);
                    $('#select_all_checked').css('display', '');
                    $('#select_all_unchecked').css('display', 'none');
                    $('.cart-checked').css('display', '')
                    $('.cart-unchecked').css('display', 'none')

                    $('#cart-select-' + CartResponseDto.pdt_id).click(function () {
                        if ($('#checked-cart-' + CartResponseDto.pdt_id).is(':checked')) {
                            $('#checked-cart-' + CartResponseDto.pdt_id).prop('checked', false);
                            $('#cart-checked-' + CartResponseDto.pdt_id).css('display', 'none');
                            $('#cart-unchecked-' + CartResponseDto.pdt_id).css('display', '');
                            $('#cart-sum-hidden-' + CartResponseDto.pdt_id).attr('data-status', '0');
                            $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).attr('data-status', '0');
                            $('#select_all_checked').css('display', 'none');
                            $('#select_all_unchecked').css('display', '');
                            $('#allCheck').prop('checked', false);
                            $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                            $('#payment_price').html(total().toLocaleString('en-US') + '원');
                            $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                            $('.cart-sum').each(function () {
                                if ($(this).attr('data-status') === '0') {
                                    $('#order_submit').css('background-color', '#DDDDDD');
                                    $('#order_submit').attr('disabled', true);
                                    $('#order_submit').text('상품을 선택해주세요');
                                } else {
                                    $('#order_submit').css('background-color', '#5F0080');
                                    $('#order_submit').attr('disabled', false);
                                    $('#order_submit').text('주문하기');
                                    return false;
                                }
                            });
                        } else {
                            $('#order_submit').css('background-color', '#5F0080');
                            $('#order_submit').text('주문하기');
                            $('#order_submit').attr('disabled', false);
                            $('#checked-cart-' + CartResponseDto.pdt_id).prop('checked', true);
                            $('#cart-checked-' + CartResponseDto.pdt_id).css('display', '');
                            $('#cart-unchecked-' + CartResponseDto.pdt_id).css('display', 'none');
                            $('#cart-sum-hidden-' + CartResponseDto.pdt_id).attr('data-status', '1');
                            $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).attr('data-status', '1');
                            $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                            $('#payment_price').html(total().toLocaleString('en-US') + '원');
                            $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                            $('.cart-sum').each(function () {
                                if ($(this).attr('data-status') === '1') {
                                    $('#select_all_checked').css('display', '');
                                    $('#select_all_unchecked').css('display', 'none');
                                    $('#allCheck').prop('checked', true);
                                } else {
                                    $('#select_all_checked').css('display', 'none');
                                    $('#select_all_unchecked').css('display', '');
                                    $('#allCheck').prop('checked', false);
                                    return false;
                                }
                            });
                        }
                    });

                    $('#allCheck').click(function () {
                        if ($('#allCheck').is(':checked')) {
                            $('input:checkbox').prop('checked', true);
                        } else {
                            $('input:checkbox').prop('checked', false);
                        }
                    });


                    $('#plus-btn-' + index).click(function () {
                        $('#cart-qty-' + index).text(parseInt($('#cart-qty-' + index).text()) + 1);
                        let cart = {
                            user_id: ${id},
                            pdt_id: CartResponseDto.pdt_id,
                            pdt_qty: $('#cart-qty-' + index).text(),
                            sel_price: CartResponseDto.sel_price
                        };
                        let cartJs = {};
                        $.ajax({
                            type: 'POST',
                            url: '/carts/qty',
                            headers: {'content-type': 'application/json'},
                            dataType: 'text',
                            data: JSON.stringify(cart),
                            success: function (result) {
                                cartJs = JSON.parse(result);
                                $('#cart-sum-' + index).html((cartJs.pdt_qty * CartResponseDto.sel_price).toLocaleString('en-US') + '원');
                                $('#cart-sum-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.sel_price);
                                $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.price);
                                $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                                $('#payment_price').html(total().toLocaleString('en-US') + '원');
                                $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                            },
                            error: function () {
                                alert('제품의 재고가 부족합니다.');
                                $('#cart-qty-' + index).text($('#cart-qty-' + index).text() - 1)
                                $('#plus-btn-' + index).attr('disabled', true);
                            }
                        });
                    });
                    $('#minus-btn-' + index).click(function () {
                        if ($('#cart-qty-' + index).text() <= 1) {
                            $('#minus-btn-' + index).css(disabled);
                        }
                        $('#cart-qty-' + index).text($('#cart-qty-' + index).text() - 1);
                        $('#plus-btn-' + index).attr('disabled', false);
                        let cart = {
                            user_id: ${id},
                            pdt_id: CartResponseDto.pdt_id,
                            pdt_qty: $('#cart-qty-' + index).text(),
                            sel_price: CartResponseDto.sel_price
                        };
                        let cartJs = {};
                        $.ajax({
                            type: 'POST',
                            url: '/carts/qty',
                            headers: {'content-type': 'application/json'},
                            dataType: 'text',
                            data: JSON.stringify(cart),
                            success: function (result) {
                                cartJs = JSON.parse(result);
                                $('#cart-sum-' + index).html((cartJs.pdt_qty * CartResponseDto.sel_price).toLocaleString('en-US') + '원');
                                $('#cart-sum-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.sel_price);
                                $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.price);
                                $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                                $('#payment_price').html(total().toLocaleString('en-US') + '원');
                                $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                            },
                            error: function () {
                                alert('error')
                            }
                        });
                    });
                })

            },
            error: function () {
                alert('error')
            }
        });
    });
</script>
</body>
</html>