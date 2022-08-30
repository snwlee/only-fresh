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
    <title>OnlyFresh :: 결제 정보</title>
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
                <a href="/">Only 프레쉬</a>
                <div></div>
                <a href="/"></a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요"/>
                <img src="/cart/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <a href="/address/list"><img src="/cart/imgs/location.png"/></a>
                <a href="/mypage"><img src="/cart/imgs/heart.png"/></a>
                <a href="/carts"><img src="/cart/imgs/shopping-cart.png"/></a>
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
        <h2>결제 정보</h2>
        <div id="container">
            <div id="product_list">
                <h4 class="product_type">주문자 상세</h4>
                <div class="products_container">
                    <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                    <div id="user-info"></div>
                    <div class="payment_row">
                        <span style="font-size: 24px;"><fmt:formatDate value="${paymentResponse.in_date}" type="date"
                                                                       dateStyle="full"/>  주문 • <span
                                style="font-size: 24px; color: #cacaca;">주문번호 ${paymentResponse.ord_id}</span></span>
                        <span></span>
                    </div>
                    <div id="product"></div>
                </div>
                <h4 class="product_type">배송 정보</h4>
                <div class="products_container">
                    <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                    <div id="address"></div>
                </div>
                <h4 class="product_type">결제 정보</h4>
                <div class="products_container">
                    <!-- 여기에 상품들을 jquery, ajax 로 원하는 만큼 넣기 -->
                    <div id="payment"></div>
                    <div class="payment_row">
                        <span>총 결제금액</span>
                        <span><fmt:formatNumber value="${paymentResponse.all_amt}" pattern="###,###"/> 원</span>
                    </div>
                    <a href="/">
                        <button id="order_submit" type="button"
                                style="cursor: pointer; font-weight: 500; font-size: 16px; margin-left: 5px;">
                            계속해서 쇼핑하기
                        </button>
                    </a>
                </div>
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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="/payment/js/payment.js"></script>
<script type="text/javascript" src="/category/js/category.js"></script>
<script>
    /**
     * 배송지 정보 요청
     */
    $.ajax({
        type: 'GET',
        url: '/orders/address',
        datatype: 'json',
        success: function (result) {
            let address =
                `<div class="payment_row">
                        <span style="font-size: 24px;">배송 중 • <span style="font-size: 24px; color: green;"><fmt:formatDate value="${paymentResponse.in_date}" type="date" pattern="MM/dd(E)"/> 도착 예정</span></span>
                        <span></span>
                    </div>
                    <div class="payment_row">
                        <span>받으시는 분</span>
                        <span>` + result.addr_name + `</span>
                    </div>
                    <div class="payment_row">
                        <span>연락처</span>
                        <span>` + result.addr_tel.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`) + `</span>
                    </div>
                    <div class="payment_row">
                        <span>받는 주소</span>
                        <span>` + result.main_addr + ` ` + result.sub_addr + `</span>
                    </div>`;
            $('#address').append(address);
        },
        error: function () {
            alert('배송지를 등록해 주세요');
            location.href = '/address/list';
        }
    });
</script>
</body>
</html>