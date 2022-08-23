<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 게시판</title>
    <link rel="stylesheet" type="text/css" href="/product_detail/reset.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/navigation.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/product_detail.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        .title {
            padding-left: 50px;
            text-align: left;
        }
        .no, .grade, .writer, .reg_date, .like_cnt{
            text-align: center;
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
            background-color: #795b8f;
            border: 1px solid #5f0080;
            float:right;
            display: inline-block;
            color: #fff;
            font-size: 13px;
            text-align: center;
            line-height:30px;
            width:130px;
        }
        #review_view #buttons p{
            float:right;
            height:34px;
            padding: 0 13px 0 12px;
            font-size: 12px;
            color: #5f0080;
            line-height: 32px;
            text-align: center;
            border: 1px solid #5f0080;
            margin-left: 28px;
        }
        #review_view .review_content {
            width: 100%;
            word-break: break-word;
            padding: 20px 9px 30px;
            line-height: 25px
        }
        .ph{text-align: center;}

        .paging-active {
            background-color: rgb(216, 216, 216);
            border-radius: 5px;
            color: rgb(24, 24, 24);
        }
        .page {
            color: black;
            padding: 6px;
            margin-right: 10px;
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
        .modal-content {
            border-top: 1px solid #522772;
            border-bottom: 1px solid #522772;

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
            height: 34px;
            padding: 0 13px 0 12px;
            font-size: 12px;
            color: #5f0080;
            line-height: 32px;
            text-align: center;
            border: 1px solid #5f0080;
            margin-top: 10px;
            margin-left: 28px;
        }
        /*modal css end*/

    </style>
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
                    <option value="latest" selected>최근등록순</option>
                    <option value="like">추천</option>
                </select>
            </div>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <colgroup>
                <col style="width:70px;">
                <col style="width:auto;">
                <col style="width:40px;">
                <col style="width:88px;">
                <col style="width:85px;">
                <col style="width:98px;">
            </colgroup>
            <tbody>
            <tr>
                <th class="no" scope="col">번호</th>
                <th class="title" scope="col">제목</th>
                <th class="grade" scope="col" style="display:block">등급</th>
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
                    <p id="modal-title" class="modal-title">상품 리뷰하기</p>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>제목</td>
                            <td>
                                <div class="field_cmt">
                                    <input class="form-control1" id="bbs_title" type="text" placeholder="제목을 입력해주세요">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <div class="field_cmt">
                                    <textarea class="form-control2" id="contents" cols="100" rows="10"
                                              placeholder="내용을 입력해주세요"></textarea>
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

    let showList = function(pdt_id, sortType){
        $.ajax({
            type:'GET',
            url: '/board?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd+'&page='+page+'&pageSize='+pageSize+'&sortType='+sortType,
            success : function(result){
                $("#board").html(toHtml(result));
            },
            error   : function(){ alert("error") }
        });
    }

    let toHtml =function(lists){
        let tmp = "";
        lists.forEach(function(BoardDto){
            if(BoardDto.notice=='1')
                BoardDto.bbs_title = ('<b style="font-weight:900">공지  </b>'+BoardDto.bbs_title);
            tmp += '<table class="tb1" width="100%">'
            tmp += '<colgroup>'
            tmp += '<col style="width:70px;">'
            tmp += '<col style="width:auto;">'
            tmp += '<col style="width:51px;">'
            tmp += '<col style="width:77px;">'
            tmp += '<col style="width:100px;">'
            tmp += '<col style="width:80px;">'
            tmp += '</colgroup>'
            tmp += '<tbody>'
            tmp += '<tr class="tr1">'
            tmp += '<td class="no">'+BoardDto.bbs_id+'</td>'
            tmp += '<td class="title">'
            tmp += '<div class="title_btn" data-bbs_id ='+BoardDto.bbs_id+ '><dt class="title_cn" data-id ='+BoardDto.user_id+' data-bbs_id ='+BoardDto.bbs_id+'>'+BoardDto.bbs_title+'</dt></div>'
            tmp += '</td>'
            tmp += '<td class="grade">VIP</td>'
            tmp += '<td class="writer">'+BoardDto.user_nm+'</td>'
            tmp += '<td class="reg_date">'+dateToString(BoardDto.wrt_dt)+'</td>'
            tmp += '<td class="like_cnt">'+BoardDto.revw_like+'</td>'
            tmp += '</tr>'
            tmp += '</tbody>'
            tmp += '</table>'
        })
        return tmp;
    }

    let addZero = function(value=1){
        return value > 9 ? value : "0"+value;
    }

    let dateToString = function(ms=0) {
        let date = new Date(ms);

        let yyyy = date.getFullYear();
        let mm = addZero(date.getMonth() + 1);
        let dd = addZero(date.getDate());

        let HH = addZero(date.getHours());
        let MM = addZero(date.getMinutes());
        let ss = addZero(date.getSeconds());

        return yyyy+"."+mm+"."+dd;
    }

    let relocateCn = function(){
        $("#review_view").css("display", "none");
        $(".review_content").text('');
        $("#review_view").appendTo(".p_write_btn");
    };

    let locateCn = function(bbs_id){
        $("#review_view").appendTo($("div[data-bbs_id=" + bbs_id + "]"));
        $("#review_view").css("display", "block");
    }
    let resetButtons = function(){
        $(".mod_btn").attr("style", "display:none");
        $(".del_btn").attr("style", "display:none");
        $(".like_button").attr("style", "display:none");
    }

    let deleteModalValue = function () {
        $("#myModal #bbs_title").val('');
        $("#myModal #contents").val('');
        $("#myModal .btn-write").attr('class',"btn-write");
        $("#myModal .btn-modify").text("등록");
    };

    $(document).ready(function(){
        showList(pdt_id);
        let readStatus = false;
        resetButtons();

        if(${sessionScope.memberResponse==null}) {
            $(".p_write_btn").click(function () {
                window.parent.location.href = "/members";
            })
        }

        $("#board").on("click", ".title_cn", function() {
            if (!readStatus) {
                let bbs_id = $(this).attr("data-bbs_id");
                let writer_id = $(this).attr("data-id");
                readStatus = true;
                $.ajax({
                    type: 'GET',
                    url: '/board/'+bbs_id+'?bbs_clsf_cd='+bbs_clsf_cd,
                    headers: {"content-type": "application/json"},
                    success: function (result) {
                        $(".del_btn").attr("data-bbs_id", bbs_id);
                        $(".mod_btn").attr("data-bbs_id", bbs_id);
                        $(".like_button").attr("data-bbs_id", bbs_id);
                        $(".review_content").text(result.boardDto.bbs_cn);

                        if(${sessionScope.memberResponse!=null}){
                            if(writer_id===user_id){
                                $(".mod_btn").attr("style", "display:block");
                                $(".del_btn").attr("style", "display:block");
                            }else{
                                $(".like_button").attr("style", "display:block");
                            }
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
                locateCn(bbs_id);
            } else {
                relocateCn();
                readStatus = false;
                resetButtons();
            }
        })


        $("#sort-option").change(function(){
            let sortType = this.value;
            showList(pdt_id, sortType);
        });

        $(".p_write_btn").click(function(){
            $(".modal").css("display","flex");
        })

        $("#myModal").on("click", ".btn-write", function(){

            let bbs_title = $("#myModal #bbs_title").val();
            let bbs_cn = $("#myModal #contents").val();

            if(bbs_cn.trim()==''|bbs_title.trim()==''){
                alert("제목 또는 내용을 입력해주세요.");
                $("#myModal #contents").focus()
                return;
            }
            $.ajax({
                type:'POST',
                url: '/board?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn}),
                success : function(result){
                    alert(result);
                    relocateCn();
                    readStatus = false;
                    showList(pdt_id);
                    deleteModalValue();
                    $(".modal").css("display","none");
                },
                error   : function(){ alert("error") }
            });
            $(".close").trigger("click");
        });

        $(".close").click(function(){
            $(".modal").css("display","none");
            deleteModalValue();
        });

        $(".btn-cancel").click(function(){
            $(".modal").css("display","none");
            deleteModalValue();
        });

        $("#board").on("click", ".del_btn", function(){
            let bbs_id = $(this).attr("data-bbs_id");
            if(!confirm("정말로 글을 삭제하시겠습니까?")) return;
            $.ajax({
                type:'DELETE',
                url: '/board/'+bbs_id+'?pdt_id='+pdt_id,
                success : function(result){
                    alert(result)
                    relocateCn();
                    readStatus = false;
                    showList(pdt_id);
                },
                error   : function(){ alert("error") }
            });

        });

        $("#board").on("click", ".mod_btn", function(e){
            let target = e.target;
            let bbs_id = target.getAttribute("data-bbs_id");

            let div = $("div[data-bbs_id="+bbs_id+"]");
            let bbs_title = $(".title_cn", div).first().text();
            let bbs_cn = $(".review_content", div).first().text();

            $("#myModal #bbs_title").val(bbs_title);
            $("#myModal #contents").val(bbs_cn);
            $("#myModal .btn-write").attr('class',"btn-modify");
            $("#myModal .btn-modify").text("수정");
            $("#myModal .btn-modify").attr("data-bbs_id", bbs_id);

            $(".modal").css("display","flex");

        });

        $("#myModal").on("click", ".btn-modify", function(){
            let bbs_title = $("#myModal #bbs_title").val();
            let bbs_cn = $("#myModal #contents").val();
            let bbs_id = $(this).attr("data-bbs_id");

            if(bbs_cn.trim()==''|bbs_title.trim()==''){
                alert("제목 또는 내용을 입력해주세요.");
                $("#myModal #contents").focus()
                return;
            }
            $.ajax({
                type:'PATCH',
                url: '/board/'+bbs_id+'?pdt_id='+pdt_id,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn}),
                success : function(result){
                    alert(result);
                    relocateCn();
                    readStatus = false;
                    showList(pdt_id);
                    $(".modal").css("display","none");
                },
                error   : function(){ alert("error") }
            });
            $(".close").trigger("click");
        });

        if(${sessionScope.memberResponse !=null}) {
            $("#board").on("click", ".like_button", function () {
                let bbs_id = $(this).attr("data-bbs_id");
                $.ajax({
                    type: 'PATCH',
                    url: '/like/' + bbs_id,
                    success: function (result) {
                        relocateCn();
                        readStatus = false;
                        showList(pdt_id);
                    },
                    error : function(){ alert("you pushed like-btn in this review already.")}
                });
            });
        }
    });
</script>
</body>
</html>