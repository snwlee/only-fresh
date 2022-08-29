
$('#delete-checked').click(function () {

    let checkArr = [];

    $("input[class='checked-cart']:checked").each(function () {
        checkArr.push($(this).attr("data-pdt-id"));
    });

    if (checkArr.length === 0) {
        $(this).css('cursor', 'default');
        return;
    } else {
        $(this).css('cursor', 'pointer');
    }

    $("#checked-del").val(checkArr);

    $('#del-form').submit();
});

$("#order_submit").click(function () {

    $(this).prop('disabled', true).css('cursor', 'wait').css('background-color', '#DDDDDD').text('재주문시 새로고침 해주세요');

    let checkArr = [];

    $("input[class='checked-cart']:checked").each(function () {
        checkArr.push($(this).attr("data-pdt-id"));
    });

    if (checkArr.length === 0) {
        return;
    }

    $("#checked").val(checkArr);

    $('#form').submit();
});
String.prototype.insertAt = function (index, str) {
    return this.slice(0, index) + str + this.slice(index)
}

/**
 * 쿠키 가져오기
 */
function getCookie(key) {
    let result = null;
    let cookie = document.cookie.split(';');
    cookie.some(function (item) {
        // 공백을 제거
        item = item.replace(' ', '');

        let dic = item.split('=');

        if (key === dic[0]) {
            result = dic[1];
            return true;
        }
    });
    return result;
}

/**
 * 배송지 정보 요청
 */
if (getCookie('tempCart') === null) {
    $.ajax({
        type: 'GET',
        url: '/orders/address',
        datatype: 'json',
        success: function (result) {
            let user =
                `
                    <h4>배송지</h4>
                    <p>` + result.main_addr + ` ` + result.sub_addr + `</p>
                    <p id="is_star_deli">샛별배송</p>
                    <a href="/address/list"><button>배송지 변경</button></a>
                    `;
            $('#shipping').html(user);
        },
        error: function () {
            alert('배송지를 등록해 주세요');
            location.href = '/address/list';
        }
    });
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
                        <input type="checkbox" id="checked-cart-` + CartResponseDto.pdt_id + `" class="checked-cart" data-pdt-id="` + CartResponseDto.pdt_id + `" hidden>
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
                        <div class="cart-sum" id="cart-sum-hidden-` + CartResponseDto.pdt_id + `" data-status="1" hidden>` + CartResponseDto.pdt_qty * CartResponseDto.sel_price + `</div>
                        <div class="cart-sum-pdt" id="cart-sum-pdt-hidden-` + CartResponseDto.pdt_id + `" data-status="1" hidden>` + CartResponseDto.pdt_qty * CartResponseDto.price + `</div>
                        <p id="cart-sum-` + index + `" style="margin-bottom: 0px;
                            ">` + (CartResponseDto.pdt_qty * CartResponseDto.sel_price).toLocaleString('en-US') + `원</p>
                        <a href="/carts/delete/` + CartResponseDto.pdt_id + `"><button style="
                            margin-bottom: 5px; color: #cacaca; font-size: 16px">x</button></a>
                        <input class="pdt-stock" id="pdt-stock-` + CartResponseDto.pdt_id + `" max="` + CartResponseDto.stock + `" value="` + CartResponseDto.stock + `" hidden>
                        </div>
                        `;
                $('#cart-empty').html('');
                $('#cart').append(cart);

                if ($('#cart-qty-' + index).text() <= 1) {
                    $('#minus-btn-' + index).attr('disabled', true);
                    $('#cart-qty-' + index).text(1);
                }

                function total() {
                    let sum = 0;
                    $('.cart-sum').each(function () {
                        if ($(this).attr('data-status') === '1') {
                            sum += parseInt($(this).text());
                        }
                    });
                    return sum;
                }

                function totalPdt() {
                    let sum = 0;
                    $('.cart-sum-pdt').each(function () {
                        if ($(this).attr('data-status') === '1') {
                            sum += parseInt($(this).text());
                        }
                    });
                    return sum;
                }

                $('#select_all').off().on('click', function () {
                    if ($('#allCheck').prop('checked') === true) {
                        $('#select_all_checked').css('display', 'none');
                        $('#select_all_unchecked').css('display', 'block');
                        $('.cart-checked').css('display', 'none')
                        $('.cart-unchecked').css('display', 'block')
                        $('.cart-sum').attr('data-status', '0');
                        $('.cart-sum-pdt').attr('data-status', '0');
                        $('#order_submit').attr('disabled', true).text('상품을 선택해주세요').css('background-color', '#DDDDDD').css('cursor', 'default');
                        $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                        $('#payment_price').html(total().toLocaleString('en-US') + '원');
                        $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        $('.checked-cart').prop('checked', false);
                    } else {
                        $('#select_all_checked').css('display', 'block');
                        $('#select_all_unchecked').css('display', 'none');
                        $('.cart-checked').css('display', 'block')
                        $('.cart-unchecked').css('display', 'none')
                        $('.cart-sum').attr('data-status', '1');
                        $('.cart-sum-pdt').attr('data-status', '1');
                        $('#order_submit').text('주문하기').attr('disabled', false).css('background-color', '#5F0080').css('cursor', 'pointer');
                        $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                        $('#payment_price').html(total().toLocaleString('en-US') + '원');
                        $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        $('.checked-cart').prop('checked', true);
                    }
                    if ($('#select_all_checked').css('display') === 'none') {
                        $('#allCheck').prop('checked', false);
                    } else {
                        $('#allCheck').prop('checked', true);
                    }
                });

                $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                $('#payment_price').html(total().toLocaleString('en-US') + '원');
                $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                $('input:checkbox').prop('checked', true);
                $('#delete-checked').css('cursor', 'cursor');
                $('#select_all').css('cursor', 'cursor');
                $('#select_all_checked').css('display', 'block');
                $('#select_all_unchecked').css('display', 'none');
                $('.cart-checked').css('display', 'block')
                $('.cart-unchecked').css('display', 'none')

                $('#cart-select-' + CartResponseDto.pdt_id).click(function () {
                    if ($('#checked-cart-' + CartResponseDto.pdt_id).is(':checked')) {
                        $('#checked-cart-' + CartResponseDto.pdt_id).prop('checked', false);
                        $('#cart-checked-' + CartResponseDto.pdt_id).css('display', 'none');
                        $('#cart-unchecked-' + CartResponseDto.pdt_id).css('display', 'block');
                        $('#cart-sum-hidden-' + CartResponseDto.pdt_id).attr('data-status', '0');
                        $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).attr('data-status', '0');
                        $('#select_all_checked').css('display', 'none');
                        $('#select_all_unchecked').css('display', 'block');
                        $('#allCheck').prop('checked', false);
                        $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                        $('#payment_price').html(total().toLocaleString('en-US') + '원');
                        $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        $('.cart-sum').each(function () {
                            if ($(this).attr('data-status') === '0') {
                                $('#order_submit').text('상품을 선택해주세요').attr('disabled', true).css('background-color', '#DDDDDD').css('cursor', 'default');
                            } else {
                                $('#order_submit').text('주문하기').attr('disabled', false).css('background-color', '#5F0080').css('cursor', 'pointer');
                                return false;
                            }
                        });
                    } else {
                        $('#order_submit').text('주문하기').attr('disabled', false).css('background-color', '#5F0080').css('cursor', 'pointer');
                        $('#checked-cart-' + CartResponseDto.pdt_id).prop('checked', true);
                        $('#cart-checked-' + CartResponseDto.pdt_id).css('display', 'block');
                        $('#cart-unchecked-' + CartResponseDto.pdt_id).css('display', 'none');
                        $('#cart-sum-hidden-' + CartResponseDto.pdt_id).attr('data-status', '1');
                        $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).attr('data-status', '1');
                        $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                        $('#payment_price').html(total().toLocaleString('en-US') + '원');
                        $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        $('.cart-sum').each(function () {
                            if ($(this).attr('data-status') === '1') {
                                $('#select_all_checked').css('display', 'block');
                                $('#select_all_unchecked').css('display', 'none');
                                $('#allCheck').prop('checked', true);
                            } else {
                                $('#select_all_checked').css('display', 'none');
                                $('#select_all_unchecked').css('display', 'block');
                                $('#allCheck').prop('checked', false);
                                return false;
                            }
                        });
                    }
                });

                $('#allCheck').click(function () {
                    if ($('#allCheck').is(':checked')) {

                        $('input:checkbox').prop('checked', true);
                    } else {
                        $('input:checkbox').prop('checked', false);
                    }
                });


                $('#plus-btn-' + index).click(function () {
                    $('#minus-btn-' + index).attr('disabled', false);
                    if ($('#cart-qty-' + index).text() < 1) {
                        $('#cart-qty-' + index).text(1);
                        return;
                    }
                    $('#cart-qty-' + index).text(parseInt($('#cart-qty-' + index).text()) + 1);
                    let cart = {
                        user_id: 1,
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
                            $('#cart-sum-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.sel_price);
                            $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.price);
                            $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                            $('#payment_price').html(total().toLocaleString('en-US') + '원');
                            $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        },
                        error: function () {
                            alert('제품의 재고가 부족합니다.');
                            $('#cart-qty-' + index).text($('#pdt-stock-' + CartResponseDto.pdt_id).val())
                            $('#plus-btn-' + index).attr('disabled', true);
                        }
                    });
                });
                $('#minus-btn-' + index).click(function () {
                    $('#plus-btn-' + index).attr('disabled', false);
                    if ($('#cart-qty-' + index).text() <= 2) {
                        $('#minus-btn-' + index).attr('disabled', true);
                        $('#cart-qty-' + index).text(1);
                    } else {
                        $('#cart-qty-' + index).text($('#cart-qty-' + index).text() - 1);
                    }
                    $('#plus-btn-' + index).attr('disabled', false);
                    let cart = {
                        user_id: 1,
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
                            $('#cart-sum-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.sel_price);
                            $('#cart-sum-pdt-hidden-' + CartResponseDto.pdt_id).html(cartJs.pdt_qty * CartResponseDto.price);
                            $('#product_price').html(totalPdt().toLocaleString('en-US') + '원');
                            $('#payment_price').html(total().toLocaleString('en-US') + '원');
                            $('#discount_price').html((total() - totalPdt()).toLocaleString('en-US') + '원');
                        },
                        error: function () {
                            alert('제품의 재고가 부족합니다.');
                            $('#cart-qty-' + index).text($('#pdt-stock-' + CartResponseDto.pdt_id).val())
                            $('#plus-btn-' + index).attr('disabled', true);
                        }
                    });
                });
            })

        },
        error: function () {
            $('#select_all_checked').css('display', 'none');
            $('#select_all_unchecked').css('display', 'block');
            $('#delete-checked').css('cursor', 'default');
            $('#select_all').css('cursor', 'default');
            $('#order_submit').attr('disabled', true).text('상품을 선택해주세요').css('background-color', '#DDDDDD').css('cursor', 'default');
            $('#allCheck').prop('checked', false);
        }
    });
});