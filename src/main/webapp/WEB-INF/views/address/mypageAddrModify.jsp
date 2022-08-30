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
    <title>OnlyFresh :: 배송지 수정</title>
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


        #mypage_content {
            width: 50%;
            height: auto;
        }

        #main_addr {
            border: none;
            width: 80%;
            margin-top: 10px;
            margin-bottom: 10px;

            /*margin: 20px 50px 30px 50px;*/
        }

        /* */

        #address_content { /* 전체 영역 */
            /*height: 100%;*/
            /*width: 100%;*/
            width: 740px;
        }

        #title { /* 배송지 수정 */
            /*-webkit-tap-highlight-color: transparent;*/
            /*-webkit-box-sizing: border-box;*/
            /*-moz-box-sizing: border-box;*/
            /*box-sizing: border-box;*/
            margin: 0;
        }

        .head {
            padding: 32px 0 0 30px;
            font-weight: 700;
            font-size: 24px;
            line-height: 36px;
            letter-spacing: -.5px;
        }

        #address { /* 전체 내용 */
            overflow: hidden;
            overflow-y: auto;
            height: 100%;
            padding-bottom: 0;
        }

        #address_modify_body { /* input창 */
            /*-webkit-tap-highlight-color: transparent;*/
            /*-webkit-box-sizing: border-box;*/
            /*-moz-box-sizing: border-box;*/
            /*box-sizing: border-box;*/
            margin: 0;
        }

        .field {
            padding-top: 22px;
        }

        #main_addr {    /* 메인 배송지 */
            padding-bottom: 12px;
            font-weight: 700;
            font-size: 16px;
            line-height: 24px;
            letter-spacing: -.3px;
        }

        .addrMain { /* 메인 배송지 */
            padding-bottom: 13px;
            font-weight: 500;
            font-size: 16px;
            line-height: 20px;
        }

        input[type=text] {
            /*width: 100%;*/
            width: 720px;
            height: 48px;
            padding: 0 11px 1px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-weight: 400;
            font-size: 16px;
            line-height: 1.5;
            color: #333;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            outline: 0;
        }

        #sub_addr { /* 서브 */
            height: 44px;
            padding: 1px 11px 0 15px;
            border-radius: 3px;
            font-family: Noto Sans;
            font-weight: 700;
            font-size: 14px;
            letter-spacing: -.5px;
        }

        .label_block { /* 받는사람 */
            padding-bottom: 7px;
            font-weight: 700;
            font-size: 14px;
            line-height: 20px;
            letter-spacing: -.3px;
        }

        .label_default { /* 기본 배송지 체크*/
            padding: 20px 0 19px;
            font-size: 14px;
        }

        /* 체크박스 */

        input[type=checkbox] {
            /*position: absolute;*/
            z-index: -1;
            /*opacity: 0;*/
        }

        input[type=checkbox] {
            width: 16px;
            height: 16px;
            border: 1px solid #999;
            border-radius: 2px;
            background: 0 0;
            vertical-align: -2px;
            /*-webkit-appearance: none;*/
            -moz-appearance: none;
            /*appearance: none;*/
        }

        input[type=checkbox]+.ico {  /* 체크표시 */
            display: inline-block;
            position: relative;
            width: 24px;
            height: 24px;
            margin-right: 12px;
            border: 0;
            background-image: url(https://res.kurly.com/mobile/service/common/2006/ico_checkbox.svg);
            background-color: transparent;
            background-repeat: no-repeat;
            background-size: 24px 24px;
            background-position: 50% 50%;
            vertical-align: -7px;
        }

        .div_default+btn.active {
            margin-top: 0;
        }

        /* 버튼 */

        .btn {
            width: 720px;
            height: 45px;
            text-align: center;
            outline: none;
            margin-bottom: 15px;
        }

        .btn.active {
            border: 1px solid #5f0081;
            background-color: #5f0080;
            color: #fff;
        }

        .btn.normal {
            border: 1px solid #ddd;
            background-color: #fff;
            color: #333;
        }

        .btn.list {
            border: 1px solid #ddd;
            background-color: #F0F0F0;
            color: #333;
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
        <div id="address_content">
            <div id="title">
                <h3 class="head">배송지 수정</h3>
            </div>
            <div id="address">
                <form id="address_modify_body">
                    <div class="modify">
                        <div class="field">
                            <div id="main_addr" class="addrMain">${addressDto.main_addr}</div>
                                <input type="text" id="sub_addr" name="sub_addr" value="${addressDto.sub_addr}"/>
                        </div>
                    </div>
                    <div class="field">
                        <label class="label_block" for="addr_name">받으실 분</label><br>
                        <input type="text" id="addr_name" name="addr_name" data-max-length="20" placeholder="이름을 입력해주세요"
                               value="${addressDto.addr_name}"/>
                    </div>
                    <div class="field">
                        <label class="label_block" for="addr_tel">휴대폰</label><br>
                        <input type="text" id="addr_tel" name="addr_tel" data-max-length="11"
                               oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                               placeholder="번호를 입력해주세요" value="${addressDto.addr_tel}" />
                    </div>
                    <div class="label_default">
                        <input type="checkbox" id="chk_addr" name="chk_addr" value="true" onclick="checkAlert()">
                        <span class="ico"></span>
                        기본 배송지로 저장
                    </div>
                    <div>
                        <button type="button" id="modifyBtn" class="btn active">
                            저장
                        </button>
                    </div>
                    <div>
                        <button type="button" id="removeBtn" class="btn normal">
                            삭제
                        </button>
                    </div>
                    <div>
                        <a href="/address/list">
                            <button type="button" id="listBtn" class="btn list">
                                목록으로 돌아가기
                            </button>
                        </a>
                    </div>
<%--                    <script src="/resources/address/js/address.js"></script>--%>
            </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
<script>
    $(document).ready(function () {

        $('#removeBtn').on("click", function () {
            // if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $('#address_modify_body');
            form.attr("action", "<c:url value='/address/remove'/>?addr_id=${param.addr_id}");
            form.attr("method", "post");
            form.submit();
        });

        $('#modifyBtn').on("click", function () {
            let form = $('#address_modify_body');
            form.attr("action", "<c:url value='/address/modify'/>?addr_id=${param.addr_id}");
            form.attr("method", "post");
            form.submit();
        });
    });
</script>
</body>
</html>