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
    <title>여기에 상품 제목 들어가유 c 태그로 잘 넣어주세용</title>
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/reset.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/navigation.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/mypage.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/myCoupon.css">
    <style>
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
            padding: 30px 200px 160px 200px;
        }

        .coupon cols {
            width: 732px;
        }

        .coupon_func second_col col {
            margin-top: 20px;
            padding-top: 20px;
        }


        .coupon_name firse_co1 {
            width: 273px;
        }

        .second_col {
            width: 120px;
        }

        .third_col {
            width: 150px;
        }

        .coupon_name first_co1 {
            text-align: center;
        }

        .chk_addr_tag {
            width: 65px;
            color: #5F0080;
            border-radius: 30px;
        }

        .coupon_due fourth_col col {
            color: ;
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
                <img style="width:82px; height: 42px" src="/mypage/myCoupon/imgs/logo.png" alt="logo"/>
                <a>마켓컬리</a>
                <div></div>
                <a>뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요"/>
                <img src="/mypage/myCoupon/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <img src="/mypage/myCoupon/imgs/location.png"/>
                <img src="/mypage/myCoupon/imgs/heart.png"/>
                <img src="/mypage/myCoupon/imgs/shopping-cart.png"/>
            </div>
        </div>
        <div id="menubar">
            <div id="category_container">
                <img src=""/>
                <span>카테고리</span>
            </div>
            <div id="menus">
                <span><a href="">신상품</a></span>
                <span><a href="">베스트</a></span>
                <span><a href="">알뜰쇼핑</a></span>
                <span><a href="/event/main">특가/혜택</a></span>
            </div>
            <div id="deli_info">
                <span id="purple_deli_info">샛별·낮</span>
                <span id="gray_deli_info">배송안내</span>
            </div>
        </div>
    </div>
    <div id="content">
        <div id="my_kurly">
            <h2>마이컬리</h2>
            <ul>
                <a href="">
                    <li>주문 내역</li>
                </a>
                <a href="">
                    <li>선물 내역</li>
                </a>
                <a href="">
                    <li>찜한 상품</li>
                </a>
                <a href="">
                    <li>배송지 관리</li>
                </a>
                <a href="">
                    <li>상품 후기</li>
                </a>
                <a href="">
                    <li>상품 문의</li>
                </a>
                <a href="">
                    <li>적립금</li>
                </a>
                <a href="">
                    <li>쿠폰</li>
                </a>
                <a href="">
                    <li>개인 정보 수정</li>
                </a>
            </ul>
        </div>
        <div id="mypage_content">
            <div id="add_coupon_box">
                <h3>배송지 관리</h3>
                <p>배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</p>
                <a href="/address/insert">
                    <button id="add_coupon_button">
                        배송지 등록
                    </button>
                </a>
            </div>

            <div id="optional_function">

            </div>
            <div id="mypage_content_body">
                <div class="cols">
<%--                    <div class="fifth_col col">선택</div>--%>
                    <div class="first_col col">주소</div>
                    <div class="second_col col">받으실 분</div>
                    <div class="third_col col">연락처</div>
                    <div class="fourth_col col">배송유형</div>
                    <div class="fifth_col col">수정</div>
                </div>
                <div id="coupons">
                    <form action="/address/default" id="form" method="post">
                        <c:forEach var="addressDto" items="${list}">
                            <div class="coupon cols">
<%--                                <div class="coupon_name fifth_col">--%>
<%--                                    <span id="select-${addressDto.addr_id}" style="display: flex;">--%>
<%--                                        <img id="select-checked-${addressDto.addr_id}"--%>
<%--                                             src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGcgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTE3Ni4wMDAwMDAsIC0xMDkwLjAwMDAwMCkgdHJhbnNsYXRlKDEwMC4wMDAwMDAsIDkzNi4wMDAwMDApIHRyYW5zbGF0ZSg2MC4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMiIgZmlsbD0iIzVGMDA4MCIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBzdHJva2U9IiNGRkYiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"--%>
<%--                                             alt=""/>--%>
<%--                                        <img id="select-unchecked-${addressDto.addr_id}"--%>
<%--                                            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgc3Ryb2tlPSIjREREIj4KICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjY5LjAwMDAwMCwgLTEwOTAuMDAwMDAwKSB0cmFuc2xhdGUoMTAwLjAwMDAwMCwgOTM2LjAwMDAwMCkgdHJhbnNsYXRlKDU1My4wMDAwMDAsIDE0Mi4wMDAwMDApIHRyYW5zbGF0ZSgxNi4wMDAwMDAsIDEyLjAwMDAwMCkiPgogICAgICAgICAgICAgICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMiIgY3k9IjEyIiByPSIxMS41Ii8+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIxLjUiIGQ9Ik03IDEyLjY2N0wxMC4zODUgMTYgMTggOC41Ii8+CiAgICAgICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"--%>
<%--                                            alt="" style="display: none"/>--%>
<%--                                                <input ${pub ?'checked':' '} type="checkbox" name="ba_addr">--%>
<%--                                        <input type="checkbox" id="checkbox-${addressDto.addr_id}" name="ba_addr"--%>
<%--                                            ${addressDto.ba_addr==true ? 'checked' : " "} hidden >--%>
<%--                                        <input type="text" name="addr_id" value="${addressDto.addr_id}" hidden>--%>
<%--                                    </span>--%>
<%--                                </div>  --%>
                                <div class="coupon_name first_col">
                                    <div class="chk_addr_tag">${addressDto.chk_addr==true ? '기본배송지' : " "}</div>
                                    <p aria-readonly="true">${addressDto.main_addr}</p>
                                    <div>
                                            ${addressDto.sub_addr}
                                    </div>
                                </div>
                                <div class="coupon_func second_col col">
                                        ${addressDto.addr_name}
                                </div>
                                <div class="coupon_rate third_col col" id="phone-${addressDto.addr_id}">
                                        ${addressDto.addr_tel}
                                </div>
                                <div class="coupon_due fourth_col col">
                                        ${addressDto.deli_type==true ? '샛별배송':'낮배송'}
                                </div>
                                <div class="coupon_used fifth_col col">
                                    <a href="<c:url value='/address/read?addr_id=${addressDto.addr_id}'/>">수정</a>
                                </div>
                            </div>
                            <script>
                                // .replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
                                // oninput="this.value = this.value
                                <%--$('#phone').text(${addressDto.addr_tel});--%>
                                $(document).ready(function () {
                                    let phone = '${addressDto.addr_tel}';
                                    $('#phone-${addressDto.addr_id}').text(phone.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`));
                                });
                                $('#checkbox-${addressDto.addr_id}').click(function () {
                                    alert("배송지 선택이 완료되었습니다.");
                                    $('#form').submit();
                                });
                                <%--$(document).ready(function () {--%>
                                <%--    $('#form').click(function () {--%>
                                <%--        if ($('#checkbox-${addressDto.addr_id}').is(":checked")) {--%>
                                <%--            alert($('#checkbox-${addressDto.addr_id}').val());--%>

                                <%--        }--%>
                                <%--    })--%>
                                <%--});--%>

                                <%--$('input:checkbox[id="#checkbox-${addressDto.addr_id}"]').val(); // 체크박스 값 가져오기--%>
                                // $('.ba_addr == 1').attr('checked', true);
                                <%--$('input:checkbox[id="checkbox-${addressDto.addr_id}"]' === 1).attr("checked", true);--%>


                                <%--$('#checkbox-${addressDto.addr_id}' === true).on(function () {--%>
                                <%--    $('#checkbox-${addressDto.addr_id}').prop('checked', true);--%>
                                <%--});--%>

                                // $('input[ba_addr=ba_addr]' === true).prop("checked", true);

                                <%--$('#select-${addressDto.addr_id}').click(function () {--%>
                                <%--    if ($('#checkbox-${addressDto.addr_id}').is(':checked')) {--%>
                                <%--        $('#select-checked-${addressDto.addr_id}').css('display', 'none');--%>
                                <%--        $('#select-unchecked-${addressDto.addr_id}').css('display', '');--%>
                                <%--        $('#checkbox-${addressDto.addr_id}').prop('checked', false);--%>
                                <%--    } else {--%>
                                <%--        $('#select-checked-${addressDto.addr_id}').css('display', '');--%>
                                <%--        $('#select-unchecked-${addressDto.addr_id}').css('display', 'none');--%>
                                <%--        $('#checkbox-${addressDto.addr_id}').prop('checked', true);--%>
                                <%--    }--%>
                                <%--});--%>
                            </script>
                        </c:forEach>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    let msg = "${param.msg}"
    if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
    if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
    if (msg == "DEL_ERR") alert("삭제에 실패했습니다.");
    if (msg == "INS_OK") alert("성공적으로 등록되었습니다.");
    if (msg == "INS_ERR") alert("등록에 실패했습니다.");
</script>
</body>
</html>