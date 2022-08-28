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
    <title>이벤트 페이지</title>
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/reset.css">
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
            flex-direction: column;
            align-items: center;
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
                <a href="/"><img style="width:82px; height: 42px" src="/mypage/myCoupon/imgs/logo.png" alt="logo"/></a>
                <a href="/">마켓컬리</a>
                <div></div>
                <a>뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요"/>
                <img src="imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <img src="imgs/location.png"/>
                <img src="imgs/heart.png"/>
                <a href="/carts/"><img src="imgs/shopping-cart.png"/></a>
            </div>
        </div>
        <div id="menubar">
            <div id="category_container">
                <img src=""/>
                <p style="width: 80px;" id="show_category_button">카테고리</p>
            </div>
            <div id="menus">
                <span><a href="/product/newlist?sort=1&page=1&pageSize=12">신상품</a></span>
                <span><a href="/product/newlist?sort=2&page=1&pageSize=12">베스트</a></span>
                <span><a href="/product/newlist?sort=3&page=1&pageSize=12">알뜰쇼핑</a></span>
                <span><a href="/event/main">특가/혜택</a></span>
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
        <img style="width: 100%; height: 200px"
             src="https://product-image.kurly.com/cdn-cgi/image/width=1050,format=auto/banner/event/27a372e4-b59a-4ced-91b9-62df044ef1da.jpg">
    </div>
    <script>
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
                tmp += '&page=1&pageSize=12"<li class="cat main_cat">'
                tmp += el.cd_name
                tmp += '</li></a>'
            })

            return tmp;
        }

        let resToImgs = (res) => {
            let tmp = "";

            res.forEach(el => {

                tmp += "<a style='margin-bottom: 29px' href='" + "/product/newlist?cd_name_num=" + el.cat_cd + "&page=1&pageSize=12'><img style='width: 100%; height: 200px;' src='" + el.photo + "'/></a>";
                // tmp += "<img width='200' height='100' src='" + el.photo + "'/>"
            })

            return tmp;
        }

        $(document).ready(() => {
                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/event/list',  // 요청 URI
                    success: function (result) {
                        $("#content").html(resToImgs(result));
                    },
                    error: function () {
                        alert("error")
                    } // 에러가 발생했을 때, 호출될 함수
                })

                $.ajax({
                    type: 'GET',       // 요청 메서드
                    url: '/product/categories',  // 요청 URI
                    success: function (res) {
                        categories = res;
                        $.each(res, (el) => {
                            $("#main_cat_container").append('<a href="/product/newlist?cd_type_name=' + el + '&page=1&pageSize=12"<li class="cat main_cat">' + el + '</li></a>');
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
            }
        )
    </script>
</div>
</body>
</html>