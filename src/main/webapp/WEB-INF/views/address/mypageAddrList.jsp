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

        #content {
            display: flex;
            justify-content: center;
            padding: 30px 200px 160px 200px;
        }

        /*    */

        #add_coupon_box {
            width: auto;
            border: 0 none;
        }

        #add_coupon_box_tits {
            /*background-color: #795b8f;*/
            height: 36px;
            font-weight: 700;
            font-size: 24px;
            line-height: 36px;
            color: #333;
            letter-spacing: -.5px;
        }

        #add_coupon_box_cmt {
            padding-left: 15px;
            font-size: 14px;
            color: #999;
            line-height: 20px;
            letter-spacing: -.3px;
            vertical-align: 3px;
        }

        #add_box_newAddress {
            padding-left: 45px;
        }

        #newAddrressAdd {
            border: 0 none;
            background-color: #fff;
            font-weight: 700;
            font-size: 14px;
            color: #333;
            line-height: 24px;
            letter-spacing: -0.5px;
            -webkit-appearance: button;
            cursor: pointer;
        }

        /* */
        #mypage_content_body {
            width: 732px;
        }

        .address_cols {
            /*background-color: #b5b5b5;*/
            width: 100%;
            display: flex;
            justify-content: space-between;
            /* border: 1px solid salmon; */
            border-bottom: 1px solid #333;
        }

        .tit_colx {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 50px;
            font-size: 14px;
            font-weight: 500;
        }

        .colx {
            display: flex;
            align-items: center;
            justify-content: center;
            height: auto;
            font-size: 14px;
            font-weight: 500;
        }

        #form {
            height: auto;
        }

        .coupon_name first_col {
            /*padding: 20px 10px 20px 20px;*/
            /*text-align: left;*/
            padding: 0;
            font-size: 16px;
            color: #333;
            line-height: 24px;
            letter-spacing: -0.3px;
            text-align: left;
            word-break: break-all;
        }

        .first_col_addr { /* 주소 사이즈 */
            width: 352px;
        }

        .second_col_addr { /* 받으실분 사이즈 */
            width: 120px;
        }

        .third_col_addr { /* 연락처 사이즈 */
            width: 100px;
        }

        .fourth_col_addr { /* 배송유형 사이즈 */
            width: 100px;
        }

        .fifth_col_addr { /* 수정 사이즈 */
            width: 60px;
        }

        /*  */
        #readBtn { /* 수정 버튼 */
            width: 24px;
            height: 24px;
            border: 0 none;
            background: url(https://res.kurly.com/mobile/ico/2006/ico_modify.png) no-repeat 50% 50%;
            font-size: 0px;
            line-height: 0;
            -webkit-appearance: button;
            cursor: pointer;
        }

        .address { /* 배송지 목록 타이틀  */
            border-bottom: 1px solid #F4F4F4;
            width: 732px;
            padding-top: 15px;
            padding-bottom: 15px;
        }

        #addressList { /* 배송지 목록 */
            width: 732px;
        }

        .address_tel { /* 연락처 사이즈 */
            font-size: small;
        }

        #deli_true { /* 샛별배송 컬러 */
            font-size: 15px;
            font-weight: 700;
            color: #4E7A51;
        }

        #deli_false { /* 낮배송 컬러 */
            color: #777777;
        }

        .chk_addr_tag_true { /* 기본 배송지 표시 */
            display: block;
            width: 74px;
            height: 22px;
            margin-bottom: 7px;
            border-radius: 11px;
            background-color: #f5f4f4;
            font-weight: 700;
            font-size: 12px;
            color: #666;
            line-height: 22px;
            letter-spacing: 0;
            text-align: center;
        }

        .addr { /* 주소 */
            padding: 0;
            font-size: 16px;
            color: #333;
            line-height: 24px;
            letter-spacing: -0.3px;
            text-align: left;
            word-break: break-all;
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
        <%-- JSP --%>
        <div id="mypage_content">
            <div id="add_coupon_box">
                <h2 id="add_coupon_box_tits">배송지 관리
                    <span id="add_coupon_box_cmt" class="">배송지에 따라 상품정보 및 배송유형이 달라질 수 있습니다.</span>
                </h2>
                <div id="add_box_newAddress">
                    <a href="/address/insert">
                        <button id="newAddrressAdd">
                            <img src="https://res.kurly.com/pc/ico/2006/ico_add_16x16.svg" alt class="ico">
                            새 배송지 추가
                        </button>
                    </a>
                </div>
            </div>

            <div id="optional_function">

            </div>
            <div id="mypage_content_body">
                <div class="address_cols">
                    <div class="first_col_addr tit_colx">주소</div>
                    <div class="second_col_addr tit_colx">받으실 분</div>
                    <div class="third_col_addr tit_colx">연락처</div>
                    <div class="fourth_col_addr tit_colx">배송유형</div>
                    <div class="fifth_col_addr tit_colx">수정</div>
                </div>
                <div id="addressList">
                    <form action="/address/default" id="form" method="post">
                        <c:forEach var="addressDto" items="${list}">
                            <div class="address colx">
                                <div class="address_main first_col_addr">
                                    <span class="chk_addr_tag_${addressDto.chk_addr}">
                                            ${addressDto.chk_addr==true ? '기본 배송지' : " "}
                                    </span>
                                    <p class="addr" aria-readonly="true">
                                            ${addressDto.main_addr}<br>
                                            ${addressDto.sub_addr}
                                    </p>
                                </div>
                                <div class="address_name second_col_addr colx">
                                        ${addressDto.addr_name}
                                </div>
                                <div class="address_tel third_col_addr colx" id="phone-${addressDto.addr_id}">
                                        ${addressDto.addr_tel}
                                </div>
                                <div class="address_deli fourth_col_addr colx">
                                    <span id="deli_${addressDto.deli_type}">
                                            ${addressDto.deli_type==true ? '샛별배송':'낮배송'}
                                    </span>
                                </div>
                                <div class="address_modify fifth_col_addr colx">
                                    <a href="/address/read?addr_id=${addressDto.addr_id}">
                                        <button type="button" id="readBtn">
                                            수정
                                        </button>
                                    </a>
                                </div>
                            </div>
                            <script>
                                $(document).ready(function () {
                                    let phone = '${addressDto.addr_tel}';
                                    $('#phone-${addressDto.addr_id}').text(phone.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`));
                                });


                                $('#checkbox-${addressDto.addr_id}').click(function () {
                                    alert("배송지 선택이 완료되었습니다.");
                                    $('#form').submit();
                                });
                            </script>
                        </c:forEach>
<%--                        <script src="/resources/address/js/address.js"></script>--%>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>