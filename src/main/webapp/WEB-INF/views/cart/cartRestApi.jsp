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
<a class="btn" href="/carts/rest/view">RESTful API</a>
<div id="cart-sum">총 장바구니 가격 : ${sum}</div>
<a class="btn" href="/orders">주문하기</a>
<div id="cart"></div>
<script>
    $(document).ready(function () {
        $.ajax({
            type: 'GET',
            url: '/carts/rest/view',
            datatype: 'json',
            success: function (result) {
                $.each(result, function (index, CartResponseDto) {
                    let cart =
                        `<div>장바구니 제품 번호 : ` + CartResponseDto.pdt_id + `</div>
                        <div>장바구니 제품 이름 : ` + CartResponseDto.title + `</div>
                        <div>장바구니 제품 가격 : ` + CartResponseDto.sel_price + `</div>
                        <div id="cart-` + index + `">장바구니 제품 개수 : ` + CartResponseDto.pdt_qty + `</div>
                        <input type="number" id="cart-qty-` + index + `" value="` + CartResponseDto.pdt_qty + `">
                        <button type="button" id="add-btn-` + index + `">+</button>
                        <button type="button" id="minus-btn-` + index + `">-</button>
                        <div id="cart-sum-` + index + `">장바구니 제품 총 가격 : ` + CartResponseDto.sel_price * CartResponseDto.pdt_qty + `</div>
                        <a class="btn" href="/carts/` + CartResponseDto.pdt_id + `">장바구니에서 제거</a>
                        <a class="btn" id="plus-` + index + `">상품 추가 +</a>
                        <a class="btn" id="minus-` + index + `">상품 제거 -</a>
                        <br>`;
                    $('#cart').append(cart);
                    $('#add-btn-' + index).click(function () {
                        $('#cart-qty-' + index).val($('#cart-qty-' + index).val() - 1 + 2);
                        let cart = {
                            user_id: ${sessionScope.user_id},
                            pdt_id: CartResponseDto.pdt_id,
                            pdt_qty: $('#cart-qty-' + index).val()
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
                                $('#cart-' + index).html('장바구니 제품 개수 : ' + cartJs.pdt_qty);
                                $('#cart-sum-' + index).html('장바구니 제품 총 가격 : ' + cartJs.pdt_qty * CartResponseDto.sel_price);
                            },
                            error: function () {
                                alert('error')
                            }
                        });
                    });
                    $('#minus-btn-' + index).click(function () {
                        if ($('#cart-qty-' + index).val() <= 1) {
                            $('#minus-btn-' + index).css(disabled);
                        }
                        $('#cart-qty-' + index).val($('#cart-qty-' + index).val() - 1);
                        let cart = {
                            user_id: ${sessionScope.user_id},
                            pdt_id: CartResponseDto.pdt_id,
                            pdt_qty: $('#cart-qty-' + index).val()
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
                                $('#cart-' + index).html('장바구니 제품 개수 : ' + cartJs.pdt_qty);
                                $('#cart-sum-' + index).html('장바구니 제품 총 가격 : ' + cartJs.pdt_qty * CartResponseDto.sel_price);
                            },
                            error: function () {
                                alert('error')
                            }
                        });
                    });

                });
            },
            error: function () {
                alert('error')
            }
        });
    });
</script>
</body>
</html>
