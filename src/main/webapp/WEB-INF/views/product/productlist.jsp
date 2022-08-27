<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true" %>
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
    <title>DevKurly :: 메인페이지</title>
    <link rel="stylesheet" type="text/css" href="/main/reset.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/main/main.css">
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

        a {
            text-decoration: none;
        }

        #search_first a {
            font-weight: 600;
        }

        a:visited {
            text-decoration: none;
            color: black;
        }

        .btn {
            cursor: pointer;
            width: 200px;
            height: 50px;
            border-radius: 5px;
            border: none;
            background-color: #5F0080;
            color: white;
            font-size: 16px;
            font-weight: 400;
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search-form {
            height: 37px;
            display: flex;
        }


        .search-form {
            height: 37px;
            display: flex;
        }

        .search-option {
            outline: none;
            margin-right: 5px;
            border: 1px solid #ccc;
            color: gray;
        }

        .search-option > option {
            text-align: center;
        }

        .search-button {
            /* 메뉴바의 검색 버튼 아이콘  */
            background-color: rgb(22, 22, 22);
            color: rgb(209, 209, 209);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }

        .search-button:hover {
            color: rgb(165, 165, 165);
        }

        .paging {
            margin-top: 1200px;
        }

        .page {
            color: black;
            padding: 6px;
            margin-right: 10px;
        }

        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
            color: rgb(24, 24, 24);
        }

        .paging-container {
            width: 100%;
            height: 70px;
            display: flex;
            margin-top: 50px;
            margin: auto;
        }

        #img {
            width: 249px;
            height: 320px;
        }

    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div id="whole_container">
    <div id="navigation">
        <div id="signup_signin_container">
            <div id="signup_signin">
                <a id="signup" href="${nameLink}">이름</a>
                <div></div>
                <a id="signin" href="${signInOutLink}">로그아웃</a>
                <div></div>
                <a id="cust">고객센터</a>
            </div>
        </div>
<%--        <div class="input-container">--%>
<%--            <form action="<c:url value="/DevKurly"/>" class="search-form" method="get">--%>
<%--                <select class="search-option" name="option">--%>
<%--                    <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>검색</option>--%>
<%--                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>상품명</option>--%>
<%--                    <option value="C" ${ph.sc.option=='C' ? "selected" : ""}>제조사명</option>--%>
<%--                </select>--%>
<%--                <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">--%>
<%--                <input type="submit" class="search-button" value="검색">--%>
<%--            </form>--%>
<%--        </div>--%>
        <div id="search">
            <div id="search_first">
                <img style="width:82px; height: 42px"
                     src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iODIiIGhlaWdodD0iNDIiIHZpZXdCb3g9IjAgMCA4MiA0MiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxnIGZpbGwtcnVsZT0ibm9uemVybyIgZmlsbD0ibm9uZSI+CiAgICAgICAgPHBhdGggZD0iTTAgMGg4MnY0MkgweiIvPgogICAgICAgIDxwYXRoIGQ9Ik02Mi41Ljk2NWMxLjAyNi0uNTU3IDIuNDY2LS43MTggMy4zNTYuMTA3Ljg5LjgyNS42NzYgMi4wNDggMCAzLjk3MyAwIDAtMS41MDUgNC4wNjYtMy4wNTUgOC4yNjJsLS4zOTggMS4wOGMtMS40MTQgMy44My0yLjc2MiA3LjQ4Ny0yLjkyNyA3Ljk2My0xLjQ5OCA0LjI0NSAxLjk2NyA0LjEyMiA0LjAyNC0uMTUyIDEuMTU5LTIuMzk0IDIuNjQ0LTYuMzU3IDIuNjQ0LTYuMzU3LjUyNC0xLjU2My42ODItMi41MDQuMzU5LTIuODI4LS4xMDctLjExMy4wNDUtLjI1Mi4xOC0uMzIzIDIuMjY5LTEuMTQ5IDQuNjMtLjA3MiAzLjMzNiAzLjMxbC0uMDU0LjEzOGMtLjM4Ny45NzgtMi42OCA2LjczMy0yLjY4IDYuNzMzLS42NzYgMS42Ni0uNTk1IDMuMjM2LjQxOCAzLjIzNi42ODYtLjAwNCAxLjQ2LS4zODUgMi4zMDQtMS4wODggMS44MTgtMS41MDQgMy4yMjItNC4zMTIgMy43MjctNS40NTQuMjMtLjUwOCAxLjA4Ny0yLjQyIDEuNzY2LTQuMzYxLjIzNi0uNjY1LjM2OS0xLjM2LjM5NS0yLjA2NWEuNDQzLjQ0MyAwIDAgMSAuMTk0LS40NTkgMy41NzggMy41NzggMCAwIDEgMS42Ny0uNDIgMS44MDUgMS44MDUgMCAwIDEgMS40NjUuNzA1Yy40NDMuNTk4LjU2NiAxLjU3OS4xMDMgMi44MDgtLjEyLjMyLTMuNzc1IDkuOTU4LTMuNzc1IDkuOTU4di4wMjZjMi4wNDEtMS4yMjMgMy44Ny0xLjMxMyA0Ljk1My0uODU0bC0uMDAzLS4wMTNjMS40OTUuNjQ3IDEuOTkgMi40NC45MzggMy41NTktLjEwMy4xMS0uMzYyLjA4NC0uMzYyLS4wOS0uMDk0LTEuMjUzLTIuNTE3LTMuNDk1LTYuMTA5LTEuMDc1bC0uMTQ1LjM4NS0xLjA2OCAyLjgwOGMtMi42MiA3LjAxOC01LjQwMyAxMi4xMzYtOS40MTUgMTEtMi42ODgtLjc2LTIuMzc3LTQuNjA3LjUxNS03Ljc5YTU0LjkgNTQuOSAwIDAgMSA2LjQ5LTUuODk4Yy4wNjgtLjE4OC4xMy0uMzUuMTg4LS41MTEuMjc4LS43OC40OTEtMS40MzQuNzkyLTIuMjY1bC4xNTktLjUxOGMtLjE3OC4yLS40OTguNTczLS43MTIuODEyLS43MTIuOC0yLjQ5NCAyLjc1Ny01LjMyOSAyLjIwN2wtLjIzNC0uMDUyYy0yLjA1LS41MDgtMi42MDgtMS45ODYtMi42NTUtMy4yNzctMi4xNDIgMi42NTYtNC4zNTEgMy40MjYtNS44MDcgMy4zOS0xLjk0OC0uMDQ4LTMuMzc4LTEuNTE0LTIuNDI3LTQuMjkgMS4wNTgtMy4xMDYgNS41LTE1LjMzMiA2Ljc5NS0xOSAuNDg1LTEuNTguNjY2LTIuNTguMTg0LTIuOTc0LS4xMjMtLjEwMy4wNTItLjI2NS4yLS4zNDZ6bTguMzY0IDI4Ljc3OGMtMS4xMDMuODgtNS41MjYgNC41My02Ljc1MiA3LjQ0MS0uNTA1IDEuMTk3LS4zNzYgMi4xNDkuNDg4IDIuMjMzIDEuOTYuMTk0IDQuMDEyLTMuODE4IDYuMjI4LTkuNTEyek0xNi4wMjggNS4zNTJjLS4wODcuMzMyLTEuMzE5IDMuODYtMi43MDEgNy43NDlsLS4yMDkuNTg2LS4yMS41ODktLjIxNS42MDRjNC42OTEtMS4xMjMgMTMuMDY0LTYuNTcgMTQuMDM1LTEwLjA4NS4xMi0uMTYxLjI5LS4yMi41NjYtLjAzNS40OTUuMzMuNjg2IDEuMTU1LjQ5NSAxLjkxOC0uNzY0IDMuMDM4LTYuNDE2IDcuMzQxLTExLjM3OSA5LjU1NC42MTIgMS42MzcgMi42ODIgNi4yNjcgNC4yMDYgOS4xMTEgMS42NjMgMy4xMTkgMy40MiA0LjU3NSA2LjE0NyA0LjczNyAxLjQ2LjA4NSAzLjAxNC0uNDQ3IDMuODkzLTEuMjJsLjE0OC0uMTQtLjAxMy4wM2MuMTk0LS4yMDQuNTExLjA3Ny4zNjYuMzIzYTYuNSA2LjUgMCAwIDEtNC45OTIgMi44NjdjLTYuMzQ1LjQyNy04Ljc3NC0zLjg3LTEzLjMwNC0xNC40OTQtLjM2Ni4xMjYtLjgwOS4yODgtMS4yNTUuNDUtLjA3NS4xODctMi4wNyA1LjY0Mi0yLjEzIDUuODIzLS45NDQgMi44Ny0xLjAwNSA0LjQ0Mi0uMzU4IDQuODk1LjE0NS4wOS4wNzQuMzMzLS4xNzguNDE0LTIuNTI3Ljc5Ni00Ljg1My0uNjk2LTMuNTU5LTQuNDQyIDEuMTYxLTMuMzE2IDUuNjktMTYuMTggNi45MTQtMTkuNjI2LjQyNy0xLjI5NC4xOTctMi4xMjUtLjQ5Mi0yLjMwNkM4LjUwNiAxLjc4Ljg3NyA4Ljc0OSAxLjk3MSAxNS4xODRjLjE5IDEuMTIuOTggMS43NDcgMS4zNzggMS42NjNhLjEzMy4xMzMgMCAwIDEgLjE1Ni4xNTkgMS41MDggMS41MDggMCAwIDEtMS44NDUgMS4wMzJDLjQ5IDE3Ljc4Mi4xMDcgMTYuNTI3LjA0MyAxNS44OC0uNjAxIDkuMjIgNi4xNDggMS4yMyAxMi4zODkuNThjMi4zNzgtLjI1IDQuNjEuOTYgMy42NCA0Ljc3MnptMjQuMDQgOS45MTMtLjA2LjIwNy0yLjgzIDguMTZjLS4zMDQuODUtLjEgMS43MzcuNTAxIDEuOTAyIDEuNzU3LjQ4MiA0LjAyOC0yLjE0NSA1LjEzMS00LjczM2E2Ny43OTQgNjcuNzk0IDAgMCAwIDEuNDc2LTMuODE1Yy41ODItMS42NDMgMS4xMDYtMy4xODMuNzgzLTMuOTA4LS4wNzUtLjE2OC4wNDUtLjI1Ni4yMjMtLjM1LjUwNS0uMjU1IDIuMjI2LS44MjUgMy4xNDEuMDY4LjY5NS42NzQuNjA5IDEuNzcxLS4wMyAzLjQzN2wtLjA5Ni4yNDIuMjItLjI3M2MyLjcwMy0zLjMgNC43OTItNC4yOTIgNi41NjMtMy41OTdsLjE0Ny4wNjJjMi4zODEgMS4wNzQgMS4xNDYgNS4yMTUtMi4xMTYgNS40OC0uMi4wMTctLjM1Ni0uMTI2LS4xNTgtLjQwNy4zOTUtLjYwNS4zNTYtMS45MDktLjc5Ni0yLjAyMi0xLjE1Mi0uMTEzLTIuODMgMS4yMDctNC4wMzggMi44NDQtMS4wODQgMS40NS0yLjIgMy45MTEtMy4zMjIgNy4yNzMtLjI3Mi44MTgtLjE0MyAxLjAxMi0uMTEgMS4wNjdhLjEuMSAwIDAgMSAwIC4wOTRjLS4xNDMuMjcyLS45NjUuNTk2LTEuNzYuNTk2LTEuNjI1LS4wMDctMi4yOTEtLjk0NS0xLjk2Ny0yLjQzNy0xLjg0OCAxLjc2NC0zLjcxMSAyLjYxNC01LjM1NSAyLjQ2NmEyLjUyNCAyLjUyNCAwIDAgMS0yLjIzNi0zLjEwM2MtMS40MjYgMS44MDktMy41NDIgMy4yNjgtNS42OTcgMy4wNjctMi4xNTUtLjItMy41LTEuNjY2LTIuODAyLTQuNzg4LjU5LTIuNTk4IDEuNTkyLTUuMjkgMi4yMDctNy4wMjcuNTE0LTEuNDU2LjYxOC0yLjQwNy4yOTQtMi43NS0uMTAzLS4xMTQuMDU1LS4yNS4xOTQtLjMyNCAxLjY5LS44ODYgNC4zOTQtLjMxNCAzLjYzIDIuMDktLjgwMiAyLjUyNy0yLjI1NSA2LjQ5LTIuNTUgNy40LS43MzcgMi4yODctLjI5IDMuNTIzLjc1NSAzLjU4IDEuMDQ1LjA2IDIuNDMtLjk2IDMuNDItMi41MDMgMS43Ni0yLjUyNCAyLjU4MS01LjY4NSAzLjM3Ny03Ljg4Mi4yMDQtLjU2LjUyNy0xLjg2Ni4xODUtMi4zNTItLjA5MS0uMTIzLjA2Ny0uMjU4LjI3NS0uMzcyIDEuNTM3LS44NDkgNC4yODUtLjY0IDMuNDAyIDIuNjA4eiIgZmlsbD0iIzVGMDA4MCIvPgogICAgPC9nPgo8L3N2Zz4K"
                     alt="logo" />
                <a href="/">마켓컬리</a>
                <div></div>
                <a href="/">뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요" />
                <img src="/main/imgs/loupe.png" style="width: 20px; height: 20px" />
            </div>
            <div id="icon_container">
                <img src="/main/imgs/location.png" />
                <img src="/main/imgs/heart.png" />
                <a href="carts/"><img src="/main/imgs/shopping-cart.png" /></a>
            </div>
        </div>
        <div id="menubar">
            <div id="category_container">
                <img src="" />
                <p style="font-size: 16px;width: 80px;" id="show_category_button">카테고리</p>
            </div>
            <div id="menus">
                <a href="/product/newlist?sort=1&page=1&pageSize=12">신상품</a>
                <a href="/product/newlist?sort=2&page=1&pageSize=12">베스트</a>
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
        <div id="min" style="display: flex; flex-direction: column; align-items: center;">

            <div class="main_title">
                <span>건강을 위한 식료품 모음집</span>
                <p>비건인들을 위한 오늘의 만찬</p>
            </div>
            <div id="product" style="display: flex;">
            </div>


            <div class="main_title">
                <span>달콤한 하루를 위한 과일 모음집</span>
                <p>과일을 사랑하는 사람들을 위한 사랑방</p>
            </div>
            <div id="product2" style="display: flex;">
            </div>


            <div class="main_title">
                <span>바다의 참맛을 누리기 위한 해산물 모음집</span>
                <p>귀하디 귀한 바다의 보배를 누리세요</p>
            </div>
            <div id="product2" style="display: flex;">
            </div>

            <div id="product3" style="display: flex;">
            </div>



<%--            <div id="product3" style="display: flex;">--%>
<%--            </div>--%>
<%--            <div id="product4" style="display: flex;">--%>
<%--            </div>--%>
<%--            <div id="product5" style="display: flex;">--%>
<%--            </div>--%>
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

    let catToLi = function(res) {
        let tmp = '';

        res.forEach(el => {
            tmp += '<a href="/product/newlist?cd_name_num='+el.cd_name_num+'&page=1&pageSize=12"<li class="cat main_cat">'+el.cd_name+'</li></a>'
        })

        return tmp;
    }

    let categories = null;

    $(document).ready(() => {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/product/categories',  // 요청 URI
                success: function (res) {
                    categories = res;
                    $.each(res, (el)=>{
                        $("#main_cat_container").append('<a href="/product/newlist?cd_type_name='+el+'&page=1&pageSize=12"<li class="cat main_cat">'+el+'</li></a>');
                    })
                },
                error: function (result) {
                    alert("쿠폰 불러오기 실패");
                }, // 에러가 발생했을 때, 호출될 함수
                complete: function(){
                    $(".main_cat").mouseenter((e) => {
                        sub_cat_container.show();
                        sub_cat_container.html(catToLi(categories[e.currentTarget.innerText]));
                    })
                }
            })
        }
    )
    <%--let page = ${param.page};--%>
    <%--let pageSize = ${param.pageSize};--%>
    let showList = function(){
        let sort = 0
        $.ajax({
            type: 'GET',
            url: '/product/call?sort='+sort,
            success : function(result){
                $("#product").html(toHtml(result.list1));
                $("#product2").html(toHtml(result.list2));
                $("#product3").html(toHtml(result.list3));
                // $("#product4").html(toHtml(result.list4));
                // $("#product5").html(toHtml(result.list5));
            },
            error : function(){alert("error")}
        });
    }

    let toHtml = function(lists){
        let tmp = "";
        lists.forEach(function(ProductDto){
            tmp += '<div class="products">'
            tmp += '<a href="/detail?pdt_id='+ProductDto.pdt_id+'"><img id="img" src="'+ProductDto.image+'"/></a>'
            tmp += '<h3 class="product_title">['+ProductDto.company +'] '+ProductDto.title+'<h3/>'
            tmp += '<div class="product"><span class="product_ds_rate">'+ProductDto.ds_rate+'%</span>'
            tmp += '<span class="product_sel_price">'+ProductDto.sel_price.toLocaleString()+'원</span></div>'
            tmp += '<span class="product_price">'+ProductDto.price.toLocaleString()+'원</span></div>'
        })
        return tmp;
    }
    $(document).ready(function () {
        showList();
        $('#ascBtn').on("click", function () {
            location.href = "<c:url value='/product/list?order_sc=sel_price'/>";
            location.href = "<c:url value='/product/list?order_sc=ds_rate'/>";
            location.href = "<c:url value='/product/list?order_sc=sales_rate'/>";
            location.href = "<c:url value='/product/list?order_sc=in_date'/>";
        });

    });
</script>
</body>
</html>