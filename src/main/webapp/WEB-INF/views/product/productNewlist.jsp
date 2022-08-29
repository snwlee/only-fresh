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
        value="${sessionScope.memberResponse==null ? '/members/signup' : '/mypage'}"
/>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevKurly</title>
    <link rel="stylesheet" type="text/css" href="/main/reset.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/product/productlist.css">
    <link rel="stylesheet" type="text/css" href="/footer.css">
    <style>
        #content a {
            text-decoration: none;
            /*font-size: 18px;*/
            font-weight: bold;
        }

        .paging {
            display: flex;
            align-items: center;
        }

        .page {
            display: flex;
            -webkit-box-align: center;
            align-items: center;
            -webkit-box-pack: center;
            justify-content: center;
            width: 34px;
            height: 34px;
            border-top: 1px solid rgb(221, 221, 221);
            border-right: 1px solid rgb(221, 221, 221);
            border-bottom: 1px solid rgb(221, 221, 221);
            border-image: initial;
            border-left: none;
            cursor: pointer;
            background-color: rgb(247, 247, 247);
        }

        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
        }

        .paging-container {
            display: flex;
            margin-top: 100px;
            margin: 0 auto;
            flex-direction: column;
            justify-content: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <!--<script src="/product/product.js"></script212121>-->
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
                <a href="/">마켓컬리</a>
                <div></div>
                <a href="/">뷰티컬리</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요" id="keyword"/>
                <img id="search_btn" src="/main/imgs/loupe.png" style="width: 20px; height: 20px"/>
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

                <a href="/product/newlist?sort=1&page=1&pageSize=12&order_sc=in_date">신상품</a></span>
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
        <div id="min" style="display: flex; flex-direction: column; align-items: center; ">

            <h3 id="page_title"></h3>
            <span id="cd_type_name" class="name"></span>
            <span id="cd_name" class="name"></span>
            <div id="sortList">
                <a href="/product/newlist?sort=${param.sort}&cd_name_num=${param.cd_name_num}&cd_type_name=${param.cd_type_name}&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"
                   id="NewAscBtn" class="SortBtn">신상품순</a>
                <a href="/product/newlist?sort=${param.sort}&cd_name_num=${param.cd_name_num}&cd_type_name=${param.cd_type_name}&page=1&pageSize=12&order_sc=sales_rate&asc=sel_price%20ASC"
                   id="SelAscBtn" class="SortBtn">판매량순</a>
                <a href="/product/newlist?sort=${param.sort}&cd_name_num=${param.cd_name_num}&cd_type_name=${param.cd_type_name}&page=1&pageSize=12&order_sc=ds_rate&asc=sel_price%20ASC"
                   id="DcAscBtn" class="SortBtn">혜택순</a>
                <a href="/product/newlist?sort=${param.sort}&cd_name_num=${param.cd_name_num}&cd_type_name=${param.cd_type_name}&page=1&pageSize=12&order_sc=adt_sts&asc=sel_price%20ASC"
                   id="DescBtn" class="SortBtn">낮은가격순</a></div>
            <div id="product" style="display: flex;">


            </div>
            <div class="paging-container">
                <div class="paging">
                    <c:if test="${totalCnt!=null && totalCnt!=0}">
                        <c:if test="${ph.showPrev}">
                            <a class="page"
                               href="<c:url value="/product/newlist${ph.sc.getQueryString(ph.beginPage-1)}&sort=${param.sort}&cd_name_num=${param.cd_name_num}&cd_type_name=${param.cd_type_name}&order_sc=${param.order_sc}&asc=${param.asc}"/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="page ${i==ph.sc.page? "paging-active" : ""}"
                               href="<c:url value="/product/newlist${ph.sc.getQueryString(i)}&sort=${param.sort}&cd_name_num=${param.cd_name_num}&cd_type_name=${param.cd_type_name}&order_sc=${param.order_sc}&asc=${param.asc}"/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="page"
                               href="<c:url value="/product/newlist${ph.sc.getQueryString(ph.endPage+1)}&sort=${param.sort}&cd_name_num=${param.cd_name_num}&cd_type_name=${param.cd_type_name}&order_sc=${param.order_sc}&asc=${param.asc}"/>">&gt;</a>
                        </c:if>
                    </c:if>
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
    let page = '<c:out value="${param.page}"/>';
    let pageSize = '<c:out value="${param.pageSize}"/>';
    let sort = '<c:out value="${param.sort}"/>';
    let cd_name_num = '<c:out value="${param.cd_name_num}"/>';
    let cd_type_name = '<c:out value="${param.cd_type_name}"/>';
    let order_sc = '${param.order_sc}';
    let asc = '${param.asc}';
    let keyword = '<c:out value="${ph.sc.keyword}"/>';
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
    let showList = function () {
        $.ajax({
            type: 'GET',
            url: '/product/call?sort=' + sort + '&cd_name_num=' + cd_name_num + '&cd_type_name=' + cd_type_name + '&page=' + page + '&pageSize=' + pageSize + '&order_sc=' + order_sc + '&asc=' + asc + '&keyword=' + keyword,
            // http://localhost/product/newlist?page=1&pageSize=12&cd_name_num=1&cd_type_name=%27%EC%B1%84%EC%86%8C%27&sort=0
            success: function (result) {
                $("#product").html(toHtml(result.list)); // 상품 리스트를 가져온다.
                $("#cd_type_name").text(result.cd_type_name);
                $("#cd_name").text(result.cd_name); // 카테고리의 이름을 가져온다.
                $("#page_title").text(result.title); // 상품의 제목을 가져온다.
            },
            error: function () {
                alert("error")
            }
        });
    }
    let toHtml = function (lists) {
        let tmp = "";
        lists.forEach(function (ProductDto) {
            tmp += '<div class="products">'
            tmp += '<a href="/detail?pdt_id=' + ProductDto.pdt_id + '"><img id="img" src="' + ProductDto.image + '"/></a>'
            tmp += '<span class="de_type">' + (ProductDto.de_type == true ? "샛별배송" : "낮배송") + '</span>'
            tmp += '<div class="product_title">' + ProductDto.title + '</div>'
            tmp += '<span class="product_ds_rate">' + ProductDto.ds_rate + '%' + '<span class="product_sel_price">' + ProductDto.sel_price.toLocaleString() + '원</span></span>'
            tmp += '<span class="product_price">' + ProductDto.price.toLocaleString() + '원</span>'
            tmp += '<span class="product_tag">' + ProductDto.tag_name + '</span></div>'
        })
        return tmp;
    }
    $(document).ready(function () {
        showList();
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
        $("#search_btn").click(function () {
            let keyword = $("#keyword").val();
            window.location.href = '/product/newlist?sort=1&keyword=' + keyword + '&page=1&pageSize=12&order_sc=in_date';
        });
        $("input[id=keyword]").keydown(function (key) {
            if (key.keyCode == 13)
                $("#search_btn").trigger("click");
        }); //검색 끝
    })
</script>
</body>
</html>