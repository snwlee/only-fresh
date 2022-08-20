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
    <link rel="stylesheet" type="text/css" href="/order/order.css">
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
    <%--    header--%>
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
    <%--보유한 쿠폰 리스트 temp--%>
    <select name='credit'>
        <option value=''>사용가능 쿠폰 0 장 / 전체 0 장</option>
        <option value='30% 쿠폰'>30% 쿠폰</option>
        <option value='35% 쿠폰'>35% 쿠폰</option>
        <option value='20% 쿠폰'>20% 쿠폰</option>
        <option value='10% 쿠폰'>10% 쿠폰</option>
    </select>
    <div>적립금 적용</div>
    <br>
    <form id="form">
        <h3>결제 수단</h3>
        <label class="remember-payment"
        ><input type="checkbox" name="remember-payment" ${empty cookie.email.value
                ? "" : "checked"}>선택한 결제 수단을 다음에도 사용</label
        >
        <div class="payment-container">
            <div>결제수단 선택</div>
            <div class="select-payment">
                <input type="text" id="payment" name="payment" hidden/>
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
        <script>
            $(document).ready(function () {
                let credit =
                    `<div>
                <select name='credit'>
                    <option value=''>카드를 선택해주세요</option>
                    <option value='현대'>현대</option>
                    <option value='신한'>신한</option>
                    <option value='비씨'>비씨</option>
                    <option value='KB국민'>KB국민</option>
                </select>
                <select name='installment'>
                    <option value=''>할부를 선택해주세요</option>
                    <option value='일시불'>일시불</option>
                    <option value='2개월'>2개월</option>
                    <option value='4개월'>4개월</option>
                    <option value='6개월'>6개월</option>
                </select>
            </div>`;
                let pay =
                    `<div>
                    <input
                        type="radio"
                        id="kurly-pay"
                        name="payment-pay"
                    /><label class="payment-pay" for="kurly-pay">컬리페이</label>
                    <input
                        type="radio"
                        id="naver-pay"
                        name="payment-pay"
                    /><label class="payment-pay" for="naver-pay">네이버페이</label>
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
        </script>
        <button class="btn" id="submit" type="submit">${sum} 원 결제하기</button>
        <script>

            $(function () {
                $('#submit').on("click", function () {

                    let form = $("#form").serialize();
                    let formJs = {};
                    console.log(form);
                    $.ajax({
                        type: "POST",
                        url: "/payments/${order_id}",
                        headers: {"content-type": "application/json"},
                        dataType: 'text',
                        data: JSON.stringify(form),
                        success: function (result) {
                            formJs = JSON.parse(result);
                            alert("success");
                            console.log(result);
                        },
                        error: function (request, status, error) {
                            console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                        }
                    });
                });
            });
        </script>
    </form>
</body>
</html>
