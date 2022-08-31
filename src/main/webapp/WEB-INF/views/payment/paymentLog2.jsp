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
    <title>OnlyFresh :: 주문내역</title>
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/reset.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/mypage.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/myCoupon.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/footer.css">
    <style>

        #pdt-title:hover{
            text-decoration: underline;
        }

        #container {
            display: flex;
            justify-content: center;
            /* border: 1px solid black; */
        }

        #product_list {
            width: 650px;
            /* border: 1px solid red; */
        }


        .select_or_delete {
            /* border: 1px solid #129090; */
            display: flex;
            align-items: center;
            width: 100%;
        }

        .select_or_delete span {
            font-size: 14px;
        }

        .select_or_delete img {
            margin: 0px 10px 0px 0px;
        }

        .select_contour {
            width: 1px;
            height: 14px;
            background-color: #ddd;
            margin: 0px 21px 0px 22px;
            vertical-align: top;
        }

        .product_type {
            margin-bottom: 20px;
            padding: 14px 0px 14px 0px;
            color: #333333;
            font-size: 20px;
            font-weight: 500;
            border-bottom: 1px solid rgb(51, 51, 51)
            /* border:1px solid black; */
        }

        .product {
            display: flex;
            align-items: center;
            margin: 4px 0px 14px 0px;
            padding: 0px 0px 10px 0px;
            border-bottom: 1px solid #F4F4F4;
        }

        .product:last-child {
            border-bottom: none;
        }

        .product h4 {
            width: 345px;
            font-weight: 500;
            font-size: 16px;
            color: #333333;
        }

        .product img {
            margin: 0px 10px 0px 0px;
        }

        .product_img {
            width: 60px;
            height: 78px;
        }

        .quantity_control_box {
            display: flex;
            /*border: 1px solid rgb(221, 223, 225);*/
            /* margin-right: 50px; */
        }

        .quantity_control_box div {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 30px;
            margin: 0;
            /* border: 1px solid salmon; */
        }

        .product button {
            width: 27px;
            height: 28px;
            background-color: transparent;
            border: none;
            cursor: pointer;
        }

        .product p {
            display: flex;
            justify-content: flex-end;
            width: 90px;
            font-weight: 700;
            font-size: 16px;
        }

        /*---*/

        #whole_container {
            width: 100%;
            height: 100vh;
        }

        button {
            width: 200px;
            height: 100px;
        }

        #content {
            display: flex;
            justify-content: center;
            padding: 30px 200px 160px 200px;
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
                <a href="/">
                    <svg width="60" height="60" xmlns="http://www.w3.org/2000/svg">
                        <image href="/logo.svg" height="60" width="60"/>
                    </svg>
                </a>
                <a href="/">Only 프레쉬</a>
                <div></div>
                <a></a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요" id="keyword"/>
                <img id="search_btn" src="/mypage/myCoupon/imgs/loupe.png" style="width: 20px; height: 20px"/>
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
    <div id="content">
        <div id="my_kurly">
            <h2>마이페이지</h2>
            <ul>
                <a href="">
                    <li>주문 내역</li>
                </a>
                <a href="">
                    <li>선물 내역</li>
                </a>
                <a href="/mypage/mypick?page=1&pageSize=5">
                    <li>찜한 상품</li>
                </a>
                <a href="">
                    <li>배송지 관리</li>
                </a>
                <a href="/mypage/myReview?page=1&pageSize=5">
                    <li>상품 후기</li>
                </a>
                <a href="/mypage/product_inquiry?page=1&pageSize=5">
                    <li>상품 문의</li>
                </a>
                <a href="">
                    <li>적립금</li>
                </a>
                <a href="/mypage">
                    <li>쿠폰</li>
                </a>
                <a href="">
                    <li>개인 정보 수정</li>
                </a>
            </ul>
        </div>
        <div id="mypage_content">
            <h3>주문내역</h3>
            <div id="mypage_content_body">
                <div class="cols">
                    <div class="first_col col">상품 정보</div>
                    <div class="second_col col">주문 일자</div>
                    <div class="third_col col">상품 수량</div>
                    <div class="fourth_col col">주문 금액</div>
                    <div class="fifth_col col">주문 상태</div>
                </div>
                <div id="product-log">
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
<script>
    /**
     * 상품 정보 요청
     */
    $.ajax({
        type: 'GET',
        url: '/payments/product',
        datatype: 'json',
        success: function (result) {
            $.each(result, function (index, payProductDto) {
                let product =
                    `<div class="coupon cols">
                    <div class="coupon_name first_col" style="display: flex; align-items: center;">
                        <span>
                        <img src="` + payProductDto.image + `"
                         alt="" class="product_img"/>
                         </span>
                         <a href="/detail?pdt_id=` + payProductDto.pdt_id + `" style="text-decoration: none; color: black;">
                        <span id="pdt-title" style="padding-left: 10px;"> [` + payProductDto.company + `] ` + payProductDto.title + `</span>
                        </a>
                    </div>
                    <div class="coupon_func second_col col" style="padding-top: 30px;">
                        <fmt:formatDate value="${date}" type="date" pattern="MM/dd(E)"/>
                    </div>
                    <div class="coupon_rate third_col col" style="padding-top: 30px;">
                        ` + payProductDto.pdt_qty + ` 개
                    </div>
                    <div class="coupon_due fourth_col col" style="padding-top: 30px;">
                        ` + (payProductDto.sel_price * payProductDto.pdt_qty).toLocaleString() + ` 원
                    </div>
                    <div class="coupon_used fifth_col col" style="padding-top: 30px;">
                         배송 준비
                    </div>
                </div>`;
                $('#product-log').append(product);
            })
        },
        error: function () {
            alert('error');
        }
    });
</script>
</body>
</html>