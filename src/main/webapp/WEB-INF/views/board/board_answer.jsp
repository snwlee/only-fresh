<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OnlyFresh :: 문의 게시판</title>
    <link rel="icon" href="/only-fresh-favicon.svg" />
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" type="text/css" href="/product_detail/reset.css">
    <link rel="stylesheet" type="text/css" href="/navigation.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/product_detail.css">
    <style>
        .title {
            padding-left: 50px;
            text-align: left;
            border: 1px solid #f4f4f4;
        }
        .title_cn{
            cursor:pointer;
        }
        .no, .writer, .reg_date, .is_replied{
            text-align: center;
        }
        #answer_mark{
            width: 25px;
        }

        #review_view {
            display: none;
            padding: 10px 10px 11px;
            border-top: 1px solid #e3e3e3;
        }

        th{
            padding-top: 18px;
            padding-bottom: 18px;
            border-bottom: 1px solid #f4f4f4;
        }

        td{
            padding-top: 18px;
            padding-bottom: 18px;
            border-bottom: 1px solid #f4f4f4;
        }
        .border_write_btn{
            padding-top: 18px;
        }
        .p_write_btn{
            background-color: #4E7A51;
            border: 1px solid #4E7A51;
            float:right;
            display: inline-block;
            color: #fff;
            font-size: 13px;
            text-align: center;
            line-height:30px;
            width:130px;
            cursor:pointer;
        }
        .btn-cancel{
            cursor:pointer;
        }
        .btn-write{
            cursor:pointer;
        }
        #review_view .buttons p{
            float:right;
            height:34px;
            padding: 0 13px 0 12px;
            font-size: 12px;
            color: #4E7A51;
            line-height: 32px;
            text-align: center;
            border: 1px solid #4E7A51;
            margin-left: 28px;
            cursor:pointer;
        }
        #review_view .review_content {
            width: 100%;
            word-break: break-word;
            padding: 20px 9px 30px;
            line-height: 25px
        }
        #review_view .Inq_answer{
            width: 120%;
            padding: 20px 9px 9px;
            line-height: 25px
        }
        .ph{text-align: center;}
        #rep_textarea{
            resize: none;
            margin-bottom: 10px;
        }

        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
            color: rgb(24, 24, 24);
        }
        .page {
            color: black;
            padding: 6px;
            margin-right: 10px;
            text-decoration: none;
        }
        /*modal css start*/
        .modal {
            display: none;
            width: 99%;
            height: 99%;
            position: absolute;
            left: -5px;
            top: -5px;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgb(235, 231, 231);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        .modal-dialog {
            background: rgb(255, 255, 255);
            box-shadow: 0 8px 32px 0 rgba(174, 144, 186, 0.322);
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 800px;
            height: 420px;
            position: relative;
            top: -100px;
            padding: 30px;

        }
        #good{
            cursor: pointer;
        }
        .modal-content {
            border-top: 1px solid #4E7A51;
            border-bottom: 1px solid #4E7A51;

        }
        #modal-title {
            font-size: 24px;
            font-weight: 500;
            padding: 10px 0 10px 20px;
            color: #333333;

        }
        .table td {
            padding: 10px 0 10px 20px;
            border-top: 1px solid #dddfe1;
            vertical-align: middle;
        }
        .form-control1 {
            width: 100%;
            height: 34px;
            font-size: 12px;
            border: 0;
            color: #000;
            line-height: 18px;
            outline: none;
        }
        .field_cmt {
            padding: 8px 10px 9px;
            border: 1px solid #dddfe1;
        }
        .form-control2 {
            overflow: hidden;
            width: 100%;
            min-height: 100px;
            border: 0;
            resize: none;
            font-size: 12px;
            color: #000;
            line-height: 18px;
            outline: none;
        }
        .modal-footer {
            height: 70px;
            padding-left: 20px;
            padding-right: 20px;
        }
        .modal-footer p {
            float: right;
            padding: 0 13px 0 13px;
            font-size: 12px;
            color: #4E7A51;
            line-height: 32px;
            text-align: center;
            border: 1px solid #4E7A51;
            margin-top: 10px;
            margin-left: 28px;
        }
        #good{
            width: 220px;
        }

        #secret_input{
            width:30px;
            margin: 0 auto;
        }
        /*modal css end*/

    </style>
</head>
<body>
<div id="inquiry_board">
    <div class="board">
        <div id="title_desc_filter_container">
            <h2>PRODUCT INQUIRY</h2>
            <div id="desc_filter">
                <div id="title_desc">
                    <p class="review_desc">- 상품에 대한 문의를 남기는 공간입니다.
                    </p>
                </div>
            </div>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <colgroup>
                <col style="width:70px;">
                <col style="width:auto;">
                <col style="width:77px;">
                <col style="width:100px;">
                <col style="width:80px;">
            </colgroup>
            <tbody>
            <tr>
                <th class="no" scope="col">번호</th>
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
    <div class="border_write_btn">
        <p class="p_write_btn">문의하기</p>
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
    </p>
    <div class="ph"><div class="paging">
        <c:if test="${totalCnt==null || totalCnt==0}">
            <div> 게시물이 없습니다. </div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
            <c:if test="${ph.showPrev}">
                <a class="page" href="<c:url value='/boardlist?pdt_id=${pdt_id}&bbs_clsf_cd=${bbs_clsf_cd}&page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>"><</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="page ${i==ph.page? "paging-active" : ""}" href="<c:url value="/boardlist?pdt_id=${pdt_id}&bbs_clsf_cd=${bbs_clsf_cd}&page=${i}&pageSize=${ph.pageSize}"/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="page" href="<c:url value='/boardlist?pdt_id=${pdt_id}&bbs_clsf_cd=${bbs_clsf_cd}&page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
            </c:if>
        </c:if>
    </div></div>
    <!-- Modal -->
    <div class="modal" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <p id="modal-title" class="modal-title">상품 문의하기</p>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>제목</td>
                            <td>
                                <div class="field_cmt">
                                    <input class="form-control1" id="bbs_title" type="text"
                                           onkeyup="characterCheck(this)" onkeydown="characterCheck(this)"
                                           placeholder="제목을 입력해주세요" maxlength="60">
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
                <div class="modal-footer" style="vertical-align: center">
                    <label id="good">
                        <input type="checkbox" id="secret_input" name="secret1" value="true">비밀글로 문의하기</input>
                    </label>
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
    let user_cls_cd = '<c:out value="${sessionScope.memberResponse.user_cls_cd}"/>';
    let memberResponse = '<c:out value="${sessionScope.memberResponse}"/>';
</script>
<script src="/product_detail/js/board_answer.js"></script>
</body>
</html>