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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevKurly :: 로그인</title>
    <link rel="stylesheet" type="text/css" href="/cart/reset.css">
    <link rel="stylesheet" type="text/css" href="/cart/navigation.css">
    <link rel="stylesheet" type="text/css" href="/cart/cart.css">
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
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<div id="whole_container">
    <div id="navigation">
        <div id="signup_signin_container">
            <div id="signup_signin">
                <a id="signup" href="">회원가입</a>
                <div></div>
                <a id="signin" href="">로그인</a>
                <div></div>
                <a id="cust">고객센터</a>
            </div>
        </div>
        <div id="search">
            <div id="search_first">
                <img style="width:82px; height: 42px" src="/cart/logo.png" alt="logo"/>
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
                <span>카테고리</span>
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
    <div class="member-out-box">
        <form
                action="/members"
                method="post"
        >
            <div class="member-submit-box">
                <div class="member-title">로그인</div>
                <button
                        id="kakao"
                        class="sns-btn"
                        onclick="location.href=''"
                        type="button"
                >
                    <img
                            id="kakao-img"
                            src="https://www.svgrepo.com/show/368252/kakao.svg"
                            style="height: 24px"
                    />
                    <span class="sns-text">카카오 로그인</span>
                </button>
                <div class="warning-msg" id="msg">${param.error}</div>
                <input
                        class="member-input-text"
                        type="text"
                        name="user_email"
                        value="${cookie.email.value}"
                        placeholder="이메일"
                />
                <input
                        class="member-input-text"
                        id="password"
                        type="password"
                        name="pwd"
                        placeholder="비밀번호"
                />
                <button type="button" onclick="change();">비밀번호 보기</button>
                <input type="hidden" name="toURL" value="${param.toURL}"/>
                <label class="remember-id">
                    <input type="checkbox" name="rememberId" ${empty cookie.email.value ? "" : "checked"}>
                    ID 기억하기
                </label>
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
                <button class="member-btn-a" type="submit">로그인</button>
            </div>
        </form>
        <a href="/members/signup">
            <button class=member-btn-b">회원가입</button>
        </a>
        <script>
            let change = function () {
                if ($('#password').prop('type') === 'password') {
                    $('#password').prop('type', 'text');
                } else {
                    $('#password').prop('type', 'password');
                }
            }
        </script>
    </div>
</div>
</body>
</html>
