<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>
<c:set
        var="selectLatest"
        value="${(param.sortType=='latest'||'') ? 'selected' : ''}"
/>
<c:set
        var="selectLike"
        value="${(param.sortType=='like') ? 'selected' : ''}"
/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OnlyFresh :: 리뷰 게시판</title>
    <link rel="icon" href="/only-fresh-favicon.svg" />
    <link rel="stylesheet" type="text/css" href="/product_detail/reset.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/product_detail.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/board.css">
    <style>
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div id="review_board">
    <div class="board">
        <div id="title_desc_filter_container">
            <h2>PRODUCT REVIEW</h2>
            <div id="desc_filter">
                <div id="title_desc">
                    <p class="review_desc">- 상품에 대한 리뷰를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수
                        있습니다.
                    </p>
                </div>
                <select id="sort-option" name="option">
                    <option value="latest" ${selectLatest}>최근등록순</option>
                    <option value="like" ${selectLike}>추천</option>
                </select>
            </div>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <colgroup>
                <col style="width:70px;">
                <col style="width:auto;">
<%--                <col style="width:40px;">--%>
                <col style="width:93px;">
                <col style="width:85px;">
                <col style="width:90px;">
            </colgroup>
            <tbody>
            <tr>
                <th class="no" scope="col">번호</th>
                <th class="title" scope="col">제목</th>
<%--                <th class="grade" scope="col" style="display:block"></th>--%>
                <th class="writer" scope="col">작성자</th>
                <th class="reg_date" scope="col">작성일</th>
                <th class="like_cnt" scope="col">추천</th>
            </tr>
            </tbody>
        </table>
        <div id="board">

        </div>
    </div>
    <div class="border_write_btn">
        <p class="p_write_btn">글쓰기</p>
    </div>
    <div id="review_view">
        <div>
            <div class="review_content"></div>
        </div>
        <div id="buttons">
            <p class="mod_btn">수정</p>
            <p class="del_btn">삭제</p>
            <p class="like_button">추천</p>
        </div>
    </div>
    </p>
    <div class="ph"><div class="paging">
        <c:if test="${totalCnt==null || totalCnt==0}">
            <div> 게시물이 없습니다. </div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
            <c:if test="${ph.showPrev}">
                <a class="page" href="<c:url value='/boardlist?pdt_id=${pdt_id}&bbs_clsf_cd=${bbs_clsf_cd}&page=${ph.beginPage-1}&pageSize=${ph.pageSize}&sortType=${param.sortType}'/>"><</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="page ${i==ph.page? "paging-active" : ""}" href="<c:url value="/boardlist?pdt_id=${pdt_id}&bbs_clsf_cd=${bbs_clsf_cd}&page=${i}&pageSize=${ph.pageSize}&sortType=${param.sortType}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="page" href="<c:url value='/boardlist?pdt_id=${pdt_id}&bbs_clsf_cd=${bbs_clsf_cd}&page=${ph.endPage+1}&pageSize=${ph.pageSize}&sortType=${param.sortType}'/>">&gt;</a>
            </c:if>
        </c:if>
    </div></div>
    <!-- Modal -->
    <div class="modal" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <p id="modal-title" class="modal-title">상품 리뷰하기</p>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>제목</td>
                            <td>
                                <div class="field_cmt">
                                    <input class="form-control1" id="bbs_title" type="text"
                                           onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" placeholder="제목을 입력해주세요" maxlength="60">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <div class="field_cmt">
                                    <textarea class="form-control2" id="contents" cols="100" rows="10"
                                              placeholder="내용을 입력해주세요" maxlength="2000"></textarea>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <p class="btn-cancel">취소</p>
                    <p class="btn-write">등록</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    let pdt_id = ${param.pdt_id};
    let page = ${param.page};
    let pageSize = ${param.pageSize};
    let bbs_clsf_cd = ${param.bbs_clsf_cd};
    let user_id = '<c:out value="${sessionScope.memberResponse.user_id}"/>';
    let sortType = '<c:out value="${param.sortType}"/>';
    let memberResponse = '<c:out value="${sessionScope.memberResponse}"/>';
</script>
<script src="/product_detail/js/board.js"></script>
</body>
</html>