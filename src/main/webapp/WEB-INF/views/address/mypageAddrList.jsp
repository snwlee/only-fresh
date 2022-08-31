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
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage'}"
/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OnlyFresh :: 배송지 목록</title>
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/reset.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/mypage.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/myCoupon.css">
    <link rel="stylesheet" type="text/css" href="/address/addrList.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/footer.css">
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
                <a href="/"></a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요" id="keyword"/>
                <img id="search_btn" src="/cart/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <a href="/address/list/"><img src="/cart/imgs/location.png"/></a>
                <img src="/cart/imgs/heart.png"/>
                <a href="/carts/"><img src="/cart/imgs/shopping-cart.png"/></a>
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
    <%-- 사이드 바 --%>
    <div id="content">
        <div id="my_kurly">
            <h2>마이페이지</h2>
            <ul>
                <a href="/payments/logs">
                    <li>주문 내역</li>
                </a>
                <a href="">
                    <li>선물 내역</li>
                </a>
                <a href="">
                    <li>찜한 상품</li>
                </a>
                <a href="/address/list/">
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
<script type="text/javascript" src="/category/js/category.js"></script>
<script>
    let msg = "${msg}"
    if(msg=="WRT_OK") alert("배송지가 등록되었습니다.");
    if(msg=="DEL_OK") alert("성공적으로 삭제되었습니다.");
    if(msg=="DEL_ERR") alert("삭제에 실패했습니다.");
    if(msg=="INS_OK") alert("배송지 등록에 성공했습니다.");
    if(msg=="INS_ERR") alert("배송지 등록에 실패했습니다.");
    if(msg=="MOD_OK") alert("배송지를 수정했습니다.");
</script>
</body>
</html>