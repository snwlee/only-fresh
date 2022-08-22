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
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage/coupon'}"
/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevKurly :: 장바구니</title>
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

        #board_container{
            text-align: center;
        }
        #productDetail{
            display: grid;
            grid-template-columns: 1fr 1fr;
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
                <a id="signup" href="${nameLink}">${name}</a>
                <div></div>
                <a id="signin" href="${signInOutLink}">${signInOut}</a>
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
    <div id="productDetail">
        <div class="pdt_img"><h2>image</h2></div>
        <div id="details">
            <div id="price_container">
                <div class="de_type">배송 : ${productDetailDto.de_type}</div>
                <div class="title">제조사 : ${productDetailDto.company} , 제목 : ${productDetailDto.title}</div>
                <div class="sub_title">소제목: ${productDetailDto.sub_title}</div>
                <div class="price">
                    <div class="ds_rate">할인율 : ${productDetailDto.ds_rate}%</div>
                    <div class="sel_price">판매가격 : ${productDetailDto.sel_price}원</div>
                    <div class="price">원가격 : ${productDetailDto.price}원</div>
                </div>
            </div><br>
            <div>
                <div class="de_type">배송 : ${productDetailDto.de_type}</div>
                <div class="seller">판매자 : 컬리</div>
                <div class="pack_cd">포장타입 : ${productDetailDto.pack_cd}</div>
                <div class="sell_cd">판매단위 : ${productDetailDto.sell_cd}</div>
                <div class="weca_cd">중량/용량 : ${productDetailDto.weca_cd}</div>
                <div class="origin">원산지 : ${productDetailDto.origin}</div>
                <div class="allg_dt">알레르기 정보 : ${productDetailDto.allg_dt}</div>
                <div class="ex_dt">유통기한 : ${productDetailDto.ex_dt}</div>
                <div class="notice">안내사항 : ${productDetailDto.notice}</div><br>
            </div>
            <div>
                구매수량, 장바구니 담기 버튼이 들어가는 곳
            </div>
        </div>
    </div>
    <div id ="board_container">
        <div id="review_board">
            <iframe src="/boardlist?pdt_id=${param.pdt_id}&bbs_clsf_cd=1&page=1&pageSize=10" width="80%">
            </iframe>
        </div>
        <div id="inquiry_board">
            <iframe src="/boardlist?pdt_id=${param.pdt_id}&bbs_clsf_cd=2&page=1&pageSize=10" width="80%">
            </iframe>
        </div>
    </div>
</div>
</body>
</html>