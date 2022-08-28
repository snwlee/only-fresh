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
    <title>마이 쿠폰 페이지</title>
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/reset.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/mypage.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/myCoupon.css">
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/navigation.css">
    <link rel="stylesheet" type="text/css" href="/footer.css">
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
                <a href="/"> <img style="width:82px; height: 42px" src="/mypage/myCoupon/imgs/logo.png" alt="logo"/></a>
                <a href="/">마켓컬리</a>
                <div></div>
                <a>뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요" id="keyword"/>
                <img id="search_btn" src="/mypage/myCoupon/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <a href="#" class="location"><img src="/main/imgs/location.png"/></a>
                <img src="/main/imgs/heart.png"/>
                <a href="/carts/"><img src="/main/imgs/shopping-cart.png"/></a>
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
                <a href="/mypage/mypick?page=1&pageSize=5">
                    <li>찜한 상품</li>
                </a>
                <a href="">
                    <li>배송지 관리</li>
                </a>
                <a href="/mypage/myReview?page=1&pageSize=5">
                    <li>상품 후기</li>
                </a>
                <a href="/mypage/product_inquiry?page=1&pageSize=5">
                    <li>상품 문의</li>
                </a>
                <a href="">
                    <li>적립금</li>
                </a>
                <a href="/mypage">
                    <li>쿠폰</li>
                </a>
                <a href="">
                    <li>개인 정보 수정</li>
                </a>
            </ul>
        </div>
        <div id="mypage_content">
            <h3>쿠폰</h3>
            <div id="add_coupon_box">
                <form id="coupon_form" onsubmit="return false;">
                    <div id="add_input_wrapper">
                        <input id="coupn_to_add" type="text" placeholder="발급된 쿠폰번호를 입력해 주세요">
                    </div>
                    <button id="add_coupon_button" onclick="addCoupon()">
                        쿠폰 등록
                    </button>
                </form>
            </div>
            <div id="is_used_tab_container">
                <div id="unused_coupons"  class="is_used_tabs">
                    사용 가능 쿠폰
                </div>
                <div id="used_coupons" class="is_used_tabs">
                    쿠폰 사용 내역
                </div>
            </div>
            <div id="optional_function">
                사용 가능 쿠폰 0 장
            </div>
            <div id="mypage_content_body">
                <div class="cols">
                    <div class="first_col col">쿠폰명</div>
                    <div class="second_col col">기능</div>
                    <div class="third_col col">할인/적립</div>
                    <div class="fourth_col col">사용가능기간</div>
                    <div class="fifth_col col">사용여부</div>
                </div>
                <div id="coupons">
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
<script>
<%--카테고리 --%>
    let wrapper = $("#cat_wrapper");
    let show_category_button = $("#show_category_button");
    let main_cat_container = $("#main_cat_container");
    let sub_cat_container = $("#sub_cat_container");
    let sub_cat = $(".sub_cat");

    show_category_button.hover(() => {
        main_cat_container.show();
    })

    wrapper.mouseleave(() => {
        main_cat_container.hide();
        sub_cat_container.hide();
    })

    sub_cat_container.mouseleave(() => {
        sub_cat_container.hide();
    })

    let categories = null;

    let catToLi = function (res) {
        let tmp = '';

        res.forEach(el => {
            tmp += '<a href="/product/newlist?cd_name_num='
            tmp += el.cd_name_num
            tmp += '&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"<li class="cat main_cat">'
            tmp += el.cd_name
            tmp += '</li></a>'
        })

        return tmp;
    }
    // 여기까지 카테고리

    let dateParse = function (str) {
        let y = str.substring(0, 4),
            m = str.substring(4, 6),
            d = str.substring(6, 8);
        return y + "년 " + m + "월 " + d + "일";
    }

    let isExpired = function (str) {
        let y = str.substring(0, 4),
            m = str.substring(4, 2),
            d = str.substring(6, 2);

        return new Date(y, m, d) < new Date(0);
    }

    let toCouponHtml = function (res) {
        let tmp = '';

        res.forEach(el => {
            tmp += '<div class="coupon cols">'
            tmp += '<div class="coupon_name first_col"> <h4>'
            tmp += el.nm
            tmp += '</h4><p>최대 '
            tmp += el.ds_max_posbl_amt.toLocaleString()
            tmp += '원 할인</p> <p>'
            tmp += (el.lmtt_cnd == null ? "" : el.lmtt_cnd)
            tmp += '</p> </div><div class="coupon_func second_col col">'
            tmp += el.func + '</div><div class="coupon_rate third_col col">'
            tmp += el.value + `\${el.unit_type ? "%" : " 원"}`
            tmp += '</div><div class="coupon_due fourth_col col">'
            tmp += dateParse(el.expi_dd)
            tmp += '까지</div><div class="coupon_used fifth_col col">'
            tmp += (el.used ? "사용" : "미사용")
            tmp += '</div></div>';
        })

        return tmp;
    }

    let coupon_container = {};

    let onOff = true;

    $(".is_used_tabs").click((e) => {
        let coupons = $("#coupons");

        onOff = !onOff;

        if(onOff){
            $("#unused_coupons").css("background-color", "#dddddd");
            $("#used_coupons").css("background-color","white")
        } else {
            $("#unused_coupons").css("background-color", "white");
            $("#used_coupons").css("background-color","#dddddd")
        }

        if (coupon_container[e.currentTarget.id].length === 0) {
            coupons.html("<div class='no_coupon_box'>쿠폰이 없습니다!</div>");
            return;
        } else if (e.currentTarget.innerText === "사용 가능 쿠폰") {
            coupons.html(toCouponHtml(coupon_container.unused_coupons));
            return;
        }
        coupons.html(toCouponHtml(coupon_container.used_coupons));
    })

    $(document).ready(() => {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/mypage/coupon',  // 요청 URI
                success: function (result) {
                    if (!result.false) {
                        coupon_container.unused_coupons = [];
                        $("#coupons").html("<div class='no_coupon_box'>쿠폰이 없습니다!</div>");
                    } else {
                        coupon_container.unused_coupons = result.false;
                        $("#optional_function").html(`사용 가능 쿠폰 \${result.false.length} 장`);
                        $("#coupons").html(toCouponHtml(result.false));
                    }

                    if (!result.true) {
                        coupon_container.used_coupons = [];
                    } else {
                        coupon_container.used_coupons = result.true;
                    }
                },
                error: function () {
                    alert("쿠폰 불러오기 실패");
                } // 에러가 발생했을 때, 호출될 함수
            });

            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/product/categories',  // 요청 URI
                success: function (res) {
                    categories = res;
                    $.each(res, (el) => {
                        $("#main_cat_container").append('<a href="/product/newlist?cd_type_name=' + el + '&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"<li class="cat main_cat">' + el + '</li></a>');
                    })
                },
                error: function (result) {
                    alert("쿠폰 불러오기 실패");
                }, // 에러가 발생했을 때, 호출될 함수
                complete: function () {
                    $(".main_cat").mouseenter((e) => {
                        sub_cat_container.show();
                        sub_cat_container.html(catToLi(categories[e.currentTarget.innerText]));
                    })
                }
            })

        //검색
        $("#search_btn").click(function(){
            let keyword = $("#keyword").val();
            window.location.href = '/product/newlist?sort=1&keyword='+keyword+'&page=1&pageSize=12&order_sc=in_date';
        });
        $("input[id=keyword]").keydown(function (key){
            if(key.keyCode==13)
                $("#search_btn").trigger("click");
        }); //검색 끝

        }
    )

    let addCoupon = function () {
        let nm = encodeURI($("#coupn_to_add").val());

        if (nm !== "") {
            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/mypage/coupon?nm=' + nm,  // 요청 URI
                success: function (res) {
                    window.location.reload();
                },
                error: function (res) {
                    if (res.status === 400) {
                        alert("쿠폰 이름을 잘못 입력하였습니다")
                    } else {
                        alert("서버에 문제가 있습니다");
                    }
                } // 에러가 발생했을 때, 호출될 함수
            })
        } else {
            alert("등록할 쿠폰의 이름을 넣어주세요!");
        }
    }
</script>
</body>
</html>