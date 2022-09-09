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
    <title>OnlyFresh :: 문의 게시판_관리자</title>
    <link rel="icon" href="/only-fresh-favicon.svg" />
    <link rel="stylesheet" type="text/css" href="/mypage/myCoupon/reset.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/footer.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/product_detail.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/board_answer.css">
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

        #inquiry_board{
            display: flex;
            width: 100%;
            flex-direction: column;
            align-items: center;
        }

        .board{
            width: 100%;
        }
        .pdt_id{
            text-align: center;
        }
        .ph{
            padding-top: 40px;
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
                <a href="/">
                    <svg width="60" height="60" xmlns="http://www.w3.org/2000/svg">
                        <image href="/logo.svg" height="60" width="60"/>
                    </svg>
                </a>
                <a href="/">Only 프레쉬</a>
            </div>
            <div id="input_container">
                <input placeholder="검색어를 입력해주세요" id="keyword"/>
                <img id="search_btn" src="/main/imgs/loupe.png" style="width: 20px; height: 20px"/>
            </div>
            <div id="icon_container">
                <a href="/address/list"><img src="/cart/imgs/location.png"/></a>
                <a href="/mypage"><img src="/cart/imgs/heart.png"/></a>
                <a href="/carts"><img src="/cart/imgs/shopping-cart.png"/></a>
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
                <span id="purple_deli_info">새벽·낮</span>
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
        <div id="inquiry_board">
            <div class="board">
                <div id="title_desc_filter_container">
                    <h2>PRODUCT INQUIRY ANSWER</h2>
                    <div id="desc_filter">
                        <div id="title_desc">
                            <p class="review_desc">- 문의에 답변을 하는 관리자의 공간입니다.
                            </p>
                        </div>
                    </div>
                </div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <colgroup>
                        <col style="width:70px;">
                        <col style="width:70px;">
                        <col style="width:auto;">
                        <col style="width:77px;">
                        <col style="width:100px;">
                        <col style="width:80px;">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="no" scope="col">번호</th>
                        <th class="no" scope="col">상품id</th>
                        <th class="title" scope="col">제목</th>
                        <th class="writer" scope="col">작성자</th>
                        <th class="reg_date" scope="col">작성일</th>
                        <th class="is_replied" scope="col">답변상태</th>
                    </tr>
                    </tbody>
                </table>
                <div id="board">

                </div>
            </div>
            <div id="review_view">
                <div>
                    <%--            <div class="back_q_mark"><img style="width: 25px" src="/product_detail/imgs/question.png"></div>--%>
                    <div class="review_content"></div>
                </div>
                <br>
                <div class="buttons">
                    <p class="rep_btn">답변하기</p>
                    <p class="mod_btn">수정</p>
                    <p class="del_btn">삭제</p>
                </div>
                <div>
                    <img id="answer_mark" src="/product_detail/imgs/answer.png">
                    <div class="Inq_answer"></div>
                    <textarea id="rep_textarea" rows="10" cols="80" style="display:none" placeholder="답변을 입력해주세요."></textarea>
                    <div class="buttons">
                        <p class="aw_wrt_btn">등록</p>
                        <p class="aw_mod_btn">수정</p>
                        <p class="aw_del_btn">삭제</p>
                        <p class="area_close">닫기</p>
                    </div>
                </div>
            </div>
            <div class="ph"><div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value='/detail/admin_board?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>"><</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.page? "paging-active" : ""}" href="<c:url value="/detail/admin_board?page=${i}&pageSize=${ph.pageSize}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value='/detail/admin_board?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
                    </c:if>
                </c:if>
            </div></div>
        </div>
    </div>
</div>
<script>
    let page = ${param.page};
    let pageSize = ${param.pageSize};
    let bbs_clsf_cd = '2';
    let user_id = '<c:out value="${sessionScope.memberResponse.user_id}"/>';
    let user_cls_cd = '<c:out value="${sessionScope.memberResponse.user_cls_cd}"/>';
    let memberResponse = '<c:out value="${sessionScope.memberResponse}"/>';
</script>
<script src="/product_detail/js/admin_board_answer.js"></script>
</body>
</html>