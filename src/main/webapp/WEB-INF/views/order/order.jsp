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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
                        name="payment"
                    /><label class="payment" for="kurly-pay">컬리페이</label>
                    <input
                        type="radio"
                        id="naver-pay"
                        name="payment"
                    /><label class="payment" for="naver-pay">네이버페이</label>
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
