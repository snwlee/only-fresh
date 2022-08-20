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
    <div id="content">
        <h2>장바구니</h2>
        <div id="container">
            <div id="product_list">
                <div class="select_or_delete">
                    <span id="select_all">
                    <img id="select_all_checked"
                         src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                         alt=""/>
                    <img id="select_all_unchecked"
                         src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                         alt="" style="display: none"/>
                    <span>전체선택<input type="checkbox" id="allCheck" checked></span>
                    </span>
                    <span class="select_contour"></span>
                    <span>선택삭제</span>
                </div>
                <div class="products_container">
                    <h4 class="product_type">냉장 상품</h4>
                    <div id="cart-empty">장바구니에 담긴 상품이 없습니다</div>
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
                                <span>0원</span>
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
                <a href="/orders/">
                    <button id="order_submit">
                        주문하기
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    $('#select_all').click(function () {
        if ($('#allCheck').is(':checked')) {
            $('input:checkbox').prop('checked', false);
            $('#select_all_checked').css('display', 'none');
            $('#select_all_unchecked').css('display', '');
            $('.cart-checked').css('display', 'none')
            $('.cart-unchecked').css('display', '')
        } else {
            $('input:checkbox').prop('checked', true);
            $('#select_all_checked').css('display', '');
            $('#select_all_unchecked').css('display', 'none');
            $('.cart-checked').css('display', '')
            $('.cart-unchecked').css('display', 'none')
        }
    });
    $("#order_submit").click(function () {

        let checkArr = [];

        $("input[class='checked-cart']:checked").each(function () {
            checkArr.push($(this).attr("pdt_id"));
        });
        console.log(checkArr);
        $("#chk").val(checkArr);
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
                        <input type="checkbox" id="checked-cart-` + CartResponseDto.pdt_id + `" class="checked-cart">
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
                        <div class="cart-sum" id="cart-sum-hidden-` + index + `" hidden>` + CartResponseDto.pdt_qty * CartResponseDto.sel_price + `</div>
                        <p id="cart-sum-` + index + `">` + (CartResponseDto.pdt_qty * CartResponseDto.sel_price).toLocaleString('en-US') + `원</p>
                        <a href="/carts/delete/` + CartResponseDto.pdt_id + `"><button>x</button></a>
                        </div>
                        `;
                    $('#cart-empty').html('');
                    $('#cart').append(cart);

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
                            $('#select_all_checked').css('display', 'none');
                            $('#select_all_unchecked').css('display', '');
                            $('#allCheck').prop('checked', false);
                        } else {
                            $('#checked-cart-' + CartResponseDto.pdt_id).prop('checked', true);
                            $('#cart-checked-' + CartResponseDto.pdt_id).css('display', '');
                            $('#cart-unchecked-' + CartResponseDto.pdt_id).css('display', 'none');
                        }
                    });

                    $('#allCheck').click(function () {
                        if ($('#allCheck').is(':checked')) {
                            $('input:checkbox').prop('checked', true);
                        } else {
                            $('input:checkbox').prop('checked', false);
                        }
                    });

                    function total() {
                        let sum = 0;
                        $('.cart-sum').each(function () {
                            sum += parseInt($(this).text());
                        });
                        return sum;
                    }

                    $('#product_price').html(total().toLocaleString('en-US') + '원');
                    $('#payment_price').html(total().toLocaleString('en-US') + '원');

                    $('#plus-btn-' + index).click(function () {
                        $('#cart-qty-' + index).text($('#cart-qty-' + index).text() - 1 + 2);
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
                                $('#cart-sum-hidden-' + index).html(cartJs.pdt_qty * CartResponseDto.sel_price);
                                $('#product_price').html(total().toLocaleString('en-US') + '원');
                                $('#payment_price').html(total().toLocaleString('en-US') + '원');
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
                                $('#cart-sum-hidden-' + index).html(cartJs.pdt_qty * CartResponseDto.sel_price);
                                $('#product_price').html(total().toLocaleString('en-US') + '원');
                                $('#payment_price').html(total().toLocaleString('en-US') + '원');
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