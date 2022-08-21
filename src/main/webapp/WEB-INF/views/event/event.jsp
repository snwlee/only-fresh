<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이벤트 페이지</title>
    <link rel="stylesheet" type="text/css" href="event/reset.css">
<%--    <link rel="stylesheet" type="text/css" href="/event/navigation.css">--%>
    <link rel="stylesheet" type="text/css" href="/cart/navigation.css">
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
                <a id="signup">회원가입</a>
                <div></div>
                <a id="signin">로그인</a>
                <div></div>
                <a id="cust">고객센터</a>
            </div>
        </div>
        <div id="search">
            <div id="search_first">
                <img style="width:82px; height: 42px" src="imgs/logo.png" alt="logo" />
                <a>마켓컬리</a>
                <div></div>
                <a>뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요" />
                <img src="imgs/loupe.png" style="width: 20px; height: 20px" />
            </div>
            <div id="icon_container">
                <img src="imgs/location.png" />
                <img src="imgs/heart.png" />
                <img src="imgs/shopping-cart.png" />
            </div>
        </div>
        <div id="menubar">
            <div id="category_container">
                <img src="" />
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
    <div id="content">
        <img style="width: 1050px; height: 200px" src="https://product-image.kurly.com/cdn-cgi/image/width=1050,format=auto/banner/event/27a372e4-b59a-4ced-91b9-62df044ef1da.jpg">
    </div>
    <script>
        let resToImgs = (res) => {
            let tmp = "";

            res.forEach(el => {
                tmp += "<a style='margin-bottom: 29px' href='"+ "/product?cat_code=" + el.cat_cd +"'><img style='width: 1050px; height: 200px;' src='"+ el.photo + "'/></a>";
                // tmp += "<img width='200' height='100' src='" + el.photo + "'/>"
            })

            return tmp;
        }

        $(document).ready(
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/event/list',  // 요청 URI
                success: function (result) {
                    console.log(result);
                    $("#content").html(resToImgs(result));
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            })
        )
    </script>
</div>
</body>
</html>