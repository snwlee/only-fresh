<%--
  Created by IntelliJ IDEA.
  User: iseon-u
  Date: 2022/08/10
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${sessionScope.user_id==null ? sessionId : sessionScope.user_id}"/>
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
<a class="btn" href="/carts/delete">장바구니 제품 전체 삭제</a>
<a class="btn" href="/carts/${pdt_id}">~~장바구니 제품 선택 삭제~~</a>
<a class="btn" href="/carts/update">~~예)상품에서 장바구니 제품 1, 10개 추가~~</a>
<a class="btn" href="/carts/rest/view">JSON</a>
<div id="cart"></div>
<div id="cart-empty">장바구니에 담긴 상품이 없습니다</div>
<div id="cart-sum"></div>
<a class="btn" href="/orders">주문하기</a>
<script>
    $(document).ready(function () {
        $.ajax({
            type: 'GET',
            url: '/carts/rest/view',
            datatype: 'json',
            success: function (result) {
                $.each(result, function (index, CartResponseDto) {
                    let cart =
                        `
                         <input
                            type="checkbox"
                            id="cart-select` + CartResponseDto.pdt_id + `"
                            name="cart-select` + CartResponseDto.pdt_id + `"
                            value="` + CartResponseDto.title + `"
                            /><label class="payment" for="cart-select` + CartResponseDto.pdt_id + `">` + CartResponseDto.title + `</label>
                        <div>장바구니 제품 번호 : ` + CartResponseDto.pdt_id + `</div>
                        <div>장바구니 제품 이름 : ` + CartResponseDto.title + `</div>
                        <div>장바구니 제품 가격 : ` + CartResponseDto.sel_price + `</div>
                        <div id="cart-` + index + `">장바구니 제품 개수 : ` + CartResponseDto.pdt_qty + `</div>
                        <input type="number" id="cart-qty-` + index + `" value="` + CartResponseDto.pdt_qty + `">
                        <button type="button" id="minus-btn-` + index + `">-</button>
                        <button type="button" id="add-btn-` + index + `">+</button>
                        <div id="cart-sum-` + index + `">장바구니 제품 총 가격 : ` + CartResponseDto.sel_price * CartResponseDto.pdt_qty + `</div>
                        <a class="btn" href="/carts/` + CartResponseDto.pdt_id + `">장바구니에서 제거</a>
                        <br>
                        `;
                    $('#cart-empty').html('');
                    $('#cart').append(cart);

                    let cart_sum = function (pdt_qty) {
                        let sum = 0;
                        $.each(result, function (index, CartResponseDto) {
                            sum += pdt_qty * CartResponseDto.sel_price;
                        });
                        $('#cart-sum').html('총 장바구니 가격 : ' + sum);
                    };
                    cart_sum(CartResponseDto.pdt_qty);

                    $('#add-btn-' + index).click(function () {
                        $('#cart-qty-' + index).val($('#cart-qty-' + index).val() - 1 + 2);
                        let cart = {
                            user_id: ${id},
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
                                $('#cart-qty-' + index).val($('#cart-qty-' + index).val() - 1);
                                alert('제품의 재고가 부족합니다.');
                            }
                        });
                    });
                    $('#minus-btn-' + index).click(function () {
                        if ($('#cart-qty-' + index).val() <= 1) {
                            $('#minus-btn-' + index).css(disabled);
                        }
                        $('#cart-qty-' + index).val($('#cart-qty-' + index).val() - 1);
                        let cart = {
                            user_id: ${id},
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
