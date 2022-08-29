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
    <title>DevKurly :: 개인 정보 수정</title>
    <link rel="stylesheet" type="text/css" href="/cart/reset.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/payment/payment.css">
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

        .form-error {
            color: #e52528;
            font-size: 12px;
            padding-top: 5px;
            text-align: center;
        }

        .member-input {
            width: 450px;
            height: 45px;
            color: #808080;
            font-size: 16px;
            background-color: #FAFAFA;
            border: 1px solid rgb(221, 221, 221);
        }

        .member-input:focus {
            font-size: 16px;
            width: 450px;
            border: 1px solid rgb(221, 221, 221);
        }

        #member-submit {
            width: 100%;
            height: 50px;
            margin-top: 20px;
            border: none;
            border-radius: 2px;
            background-color: #4E7A51;
            color: white;
        }

        #member-signup {
            width: 100%;
            height: 50px;
            margin-top: 20px;
            border: solid 1px #4E7A51;
            border-radius: 2px;
            color: #4E7A51;
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
                    <svg width="60" height="60" xmlns="http://www.w3.org/2000/svg">
                        <image href="/logo.svg" height="60" width="60"/>
                    </svg>
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
        <h2>개인 정보 수정</h2>
        <form id="form" action="/members/info" method="post" autocomplete="off">
            <div class="form-error" id="signup-error-3" ${param.error==3 ? '' : 'hidden'}>
                <img
                        src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/>
                잘못된 값이 입력 됬습니다.
            </div>
            <div id="container">
                <div id="product_list">
                    <h4 class="product_type" style="padding-top: 0px;"></h4>
                    <div class="products_container">
                        <div class="payment_row">
                            <span style="padding-top: 15px;">이메일<span style="color: orangered">*</span></span>
                            <span>
                            <input
                                    class="member-input"
                                    id="email"
                                    type="text"
                                    name="user_email"
                                    placeholder="이메일을 입력해주세요"
                                    value=""
                            />
                            <div class="form-error" id="email-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 이메일을 입력하세요.</div>
                        </span>
                        </div>
                        <div class="payment_row">
                            <span style="padding-top: 15px;">비밀번호<span style="color: orangered">*</span></span>
                            <span>
                            <input
                                    class="member-input"
                                    id="pwd"
                                    type="password"
                                    name="pwd"
                                    placeholder="비밀번호를 입력해주세요"
                            />
                            <div class="form-error" id="pwd-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 영문/숫자/특수문자 2가지 이상 조합 (8~20자)</div>
                        </span>
                        </div>
                        <div class="payment_row">
                            <span style="padding-top: 15px;">비밀번호 확인<span style="color: orangered">*</span></span>
                            <span>
                            <input
                                    class="member-input"
                                    id="cpwd"
                                    type="password"
                                    name="cPassword"
                                    placeholder="비밀번호를 한번 더 입력해주세요"
                            />
                            <div class="form-error" id="cpwd-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 확인을 위해 비밀번호를 다시 입력해주세요.</div>
                        </span>
                        </div>
                        <div class="payment_row">
                            <span style="padding-top: 15px;">이름<span style="color: orangered">*</span></span>
                            <span>
                            <input
                                    class="member-input"
                                    id="name"
                                    type="text"
                                    name="user_nm"
                                    placeholder="이름을 입력해 주세요"
                            />
                            <div class="form-error" id="name-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 이름을 정확히 입력하세요.</div>
                        </span>
                        </div>
                        <div class="payment_row">
                            <span style="padding-top: 15px;">휴대폰 번호<span style="color: orangered">*</span></span>
                            <span>
                            <input
                                    class="member-input"
                                    id="telno"
                                    type="text"
                                    name="telno"
                                    placeholder="휴대폰 번호를 입력해주세요"
                            />
                            <div class="form-error" id="phone-error" hidden><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxMiIgdmlld0JveD0iMCAwIDEyIDEyIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0NCMTQwMCIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNNiAwYzEuNjAzIDAgMy4xMS42MjQgNC4yNDMgMS43NTdDMTEuMzc2IDIuODkxIDEyIDQuMzk3IDEyIDZjMCAxLjYwMy0uNjI0IDMuMTEtMS43NTcgNC4yNDNDOS4xMDkgMTEuMzc2IDcuNjAzIDEyIDYgMTJjLTEuNjAzIDAtMy4xMS0uNjI0LTQuMjQzLTEuNzU3Qy42MjQgOS4xMDkgMCA3LjYwMyAwIDZjMC0xLjYwMy42MjQtMy4xMSAxLjc1Ny00LjI0M0MyLjg5MS42MjQgNC4zOTcgMCA2IDB6bTAgOC4yNWMtLjM0NSAwLS42MjUuMjgtLjYyNS42MjVzLjI4LjYyNS42MjUuNjI1LjYyNS0uMjguNjI1LS42MjVTNi4zNDUgOC4yNSA2IDguMjV6bS4wMTItNS43NWMtLjI3NiAwLS41LjIyNC0uNS41djRsLjAwNC4wNThjLjAyOS4yNDkuMjQuNDQyLjQ5Ni40NDIuMjc3IDAgLjUtLjIyNC41LS41VjNsLS4wMDMtLjA1OGMtLjAyOS0uMjQ5LS4yNC0uNDQyLS40OTctLjQ0MnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0ZGRiIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAxMkwxMiAxMiAxMiAwIDAgMHoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC03MzczIC0yMjQ0KSB0cmFuc2xhdGUoNzM3MyAyMjQ0KSIvPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"/> 휴대폰 번호를 정확하게 입력하세요.</div>
                        </span>
                        </div>
                    </div>
                    <h4 class="product_type"></h4>
                    <div class="products_container">
                        <div class="payment_row">
                            <span style="padding-top: 15px;">이용약관동의</span>
                            <span style="padding-top: 15px; padding-left: 320px;">개인정보 수집 이용 동의 (선택)</span>
                            <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzRFN0E1MSIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4=" class="checked" id="selected-checked" style="padding-top: 10px;" hidden/><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K" class="unchecked" id="selected-unchecked" style="padding-top: 10px;"/>
                            <input type="checkbox" id="terms" name="prvc_arge" value="1" hidden>
                        </div>
                        <div id="member-submit"
                             style="cursor: pointer; font-weight: 500; font-size: 16px; text-align: center; line-height: 50px; margin-top: 30px;">
                            회원정보수정
                        </div>
                        <div id="member-signup"
                             onclick="location.href='/members/signup'"
                             style="cursor: pointer; font-weight: 500; font-size: 16px; text-align: center; line-height: 50px; margin-top: 30px;">
                            탈퇴하기
                        </div>
                    </div>
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
<script type="text/javascript" src="/member/js/signup.js"></script>
<script type="text/javascript" src="/category/js/category.js"></script>
</body>
</html>