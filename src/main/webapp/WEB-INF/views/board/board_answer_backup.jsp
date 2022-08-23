<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 게시판</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" type="text/css" href="/product_detail/reset.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/navigation.css">
    <link rel="stylesheet" type="text/css" href="/product_detail/product_detail.css">
    <style>
        .title {
            padding-left: 50px;
            text-align: left;
        }
        .no, .writer, .reg_date, .is_replied{
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
        #review_view .buttons p{
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
            width: 120%;
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
<div id="inquiry_board">
    <div class="board">
        <div id="title_desc_filter_container">
            <h2>PRODUCT INQUIRY</h2>
            <div id="desc_filter">
                <div id="title_desc">
                    <p class="review_desc">- 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수
                        있습니다.
                    </p>
                    <p class="review_desc">- 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리내 1:1 문의에 남겨주세요.</p>
                </div>
            </div>
        </div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <colgroup>
                <col style="width:70px;">
                <col style="width:auto;">
                <col style="width:120px;">
                <col style="width:60px;">
                <col style="width:90px;">
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
            <div class="back_q_mark"><img src="/product_detail/imgs/question.svg"></div>
            <div class="review_content"></div>
        </div>
        <br>
        <div class="buttons">
            <p class="rep_btn">답변하기</p>
            <p class="mod_btn">수정</p>
            <p class="del_btn">삭제</p>
        </div>
        <div>
            <img id="answer_mark" src="/product_detail/imgs/answer.svg">
            <div class="Inq_answer"></div>
            <textarea id="rep_textarea" rows="10" cols="100" style="display:none"></textarea>
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
                    <label><input type="checkbox" name="secret1" value="true" style="margin-top:10px">비밀글로 문의하기</label>
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

    let showList = function(pdt_id){
        $.ajax({
            type:'GET',
            url: '/board?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd+'&page='+page+'&pageSize='+pageSize+'&sortType=',
            success : function(result){
                $("#board").html(toHtml(result));
            },
            error   : function(){ alert("error") }
        });
    }


    // 비밀글이면 관리자와 작성자를 제외한 유저들에게는 “비밀글입니다.”라는 글제목으로 링크를 없앤 채 회색글씨로 보이게 한다.
    let toHtml =function(lists){
        let tmp = "";
        lists.forEach(function(BoardDto){
            if(BoardDto.is_replied==true){
                BoardDto.is_replied = "답변완료";
            } else if(BoardDto.is_replied==false){
                BoardDto.is_replied = "답변대기";
            }
            if(BoardDto.notice=='1'){
                BoardDto.bbs_title = ('<b style="font-weight:900">공지  </b>'+BoardDto.bbs_title);
                BoardDto.is_replied = "-";
            }
            tmp += '<table class="tb1" width="100%" cellpadding="0" cellspacing="0">'
            tmp += '<colgroup>'
            tmp += '<col style="width:70px;">'
            tmp += '<col style="width:auto;">'
            tmp += '<col style="width:77px;">'
            tmp += '<col style="width:100px;">'
            tmp += '<col style="width:80px;">'
            tmp += '</colgroup>'
            tmp += '<tbody>'
            tmp += '<tr>'
            tmp += '<td class="no">'+BoardDto.bbs_id+'</td>'
            tmp += '<td class="title">'
            tmp += '<div class="title_btn" data-bbs_id ='+BoardDto.bbs_id+ '><dt class="title_cn" data-bbs_id ='+BoardDto.bbs_id+'>'+BoardDto.bbs_title+'</dt></div>'
            tmp += '</td>'
            tmp += '<td class="writer" value="'+BoardDto.user_id+'">'+BoardDto.user_nm+'</td>'
            tmp += '<td class="reg_date">'+dateToString(BoardDto.wrt_dt)+'</td>'
            tmp += '<td class="reply_status" style="text-align: center">'+BoardDto.is_replied+'</td>'
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

    let locateCmt = function(){
        $("#rep_textarea").attr("style", "display:block");
        $(".rep_btn").attr("style", "display:none");
        $(".aw_wrt_btn").attr("style", "display:block");
        $(".area_close").attr("style", "display:block");
    }

    let relocateCmt = function(){
        $("#rep_textarea").attr("style", "display:none");
        $(".rep_btn").attr("style", "display:block");
        $(".aw_wrt_btn").attr("style", "display:none");
        $(".area_close").attr("style", "display:none");
    }

    let deleteModalValue = function () {
        $("#myModal #bbs_title").val('');
        $("#myModal #contents").val('');
        $("#myModal .btn-write").attr('class',"btn-write");
        $("#myModal .btn-modify").text("등록");
    };

    let areaclose = function(){
        $("#rep_textarea").val("");
        $("#rep_textarea").attr("style", "display:none");
        $(".aw_wrt_btn").attr("style", "display:none");
        $(".aw_mod_btn").attr("style", "display:block");
        $(".area_close").attr("style", "display:none");
    };

    let writeAnswer = function(){
        if(${sessionScope.memberResponse.user_cls_cd=='1'})
        {
            $(".rep_btn").attr("style", "display:block");
            $(".mod_btn").attr("style", "display:block");
            $(".del_btn").attr("style", "display:block");
        }
    }

    let addBbs_idToButtons = function(bbs_id){
        $(".del_btn").attr("data-bbs_id", bbs_id);
        $(".mod_btn").attr("data-bbs_id", bbs_id);
        $(".rep_btn").attr("data-bbs_id", bbs_id);
        $(".aw_wrt_btn").attr("data-bbs_id", bbs_id);
        $(".aw_mod_btn").attr("data-bbs_id", bbs_id);
        $(".aw_del_btn").attr("data-bbs_id", bbs_id);
        $(".area_close").attr("data-bbs_id", bbs_id);
    }

    $(document).ready(function(){
        showList(pdt_id);
        let readStatus = false;

        $(".p_write_btn").click(function(){
            $(".modal").css("display","flex");
        })

        $("#myModal").on("click", ".btn-write", function(){
            let bbs_title = $("#myModal #bbs_title").val();
            let bbs_cn = $("#myModal #contents").val();

            let secretvalue = $("input:checkbox[name='secret1']:checked").val();
            let is_secret = secretvalue == "true";

            if(bbs_cn.trim()==''|bbs_title.trim()==''){
                alert("제목 또는 내용을 입력해주세요.");
                $("#myModal #contents").focus()
                return;
            }
            $.ajax({
                type:'POST',
                url: '/board?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn, is_secret:is_secret}),
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

        $("#board").on("click", ".title_cn", function() {
            if (!readStatus) {
                let bbs_id = $(this).attr("data-bbs_id");
                readStatus = true;
                $.ajax({
                    type: 'GET',
                    url: '/board/'+bbs_id+'?bbs_clsf_cd='+bbs_clsf_cd,
                    headers: {"content-type": "application/json"},
                    success: function (result) {
                        addBbs_idToButtons(bbs_id);
                        $(".review_content").text(result.boardDto.bbs_cn);

                        if(result.commentDto!=null){
                            $(".Inq_answer").text(result.commentDto.inq_ans);
                            if(${sessionScope.memberResponse==null}){
                                $(".mod_btn").attr("style","display:none");
                                $(".del_btn").attr("style","display:none");
                            }
                            $(".rep_btn").attr("style", "display:none");
                            $(".area_close").attr("style", "display:none");
                            $(".aw_wrt_btn").attr("style", "display:none");
                            $(".aw_mod_btn").attr("style", "display:none");
                            $("#answer_mark").attr("style", "display:block");
                            if(${sessionScope.memberResponse.user_cls_cd==1}){
                                $(".aw_mod_btn").attr("style", "display:block");
                                $(".aw_del_btn").attr("style", "display:block");
                            }
                        }else{
                            $(".Inq_answer").text("");

                            if(${sessionScope.memberResponse==null}){
                                $(".mod_btn").attr("style","display:none");
                                $(".del_btn").attr("style","display:none");
                            }

                            // $(".rep_btn").attr("style", "display:none");
                            $(".aw_mod_btn").attr("style", "display:none");
                            $(".aw_del_btn").attr("style", "display:none");
                            $(".area_close").attr("style", "display:none");
                            $(".aw_wrt_btn").attr("style", "display:none");
                            $("#answer_mark").attr("style", "display:none");

                            if(${sessionScope.memberResponse.user_cls_cd==1}){
                                $(".rep_btn").attr("style", "display:block");
                            }
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
                locateCn(bbs_id);
            } else {
                areaclose();
                relocateCn();
                readStatus = false;
            }
        })

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

        $("#board").on("click", ".rep_btn", function(){
            locateCmt();
            $(".area_close").click(function(){
                relocateCmt();
            });

            $(".aw_wrt_btn").click(function(){
                let inq_ans = $("#rep_textarea").val();
                let bbs_id = $(this).attr("data-bbs_id");
                let replyst = 1;

                if(inq_ans.trim()==''){
                    alert("답변을 입력해주세요.");
                    $("#rep_textarea").focus()
                    return;
                }
                $.ajax({
                    type:'POST',
                    url: '/board/comment/'+bbs_id+'?replyst='+replyst,
                    headers : { "content-type": "application/json"},
                    data : JSON.stringify({inq_ans: inq_ans}),
                    success : function(result){
                        alert(result);
                        relocateCmt();
                        relocateCn();
                        readStatus = false;
                        showList(pdt_id);

                    },
                    error   : function(){ alert("error") }
                });
            });
        });

        $("#board").on("click", ".aw_del_btn", function(){
            let bbs_id = $(this).attr("data-bbs_id");
            let replyst = 0;
            if(!confirm("정말로 답변을 삭제하시겠습니까?")) return;
            $.ajax({
                type:'DELETE',
                url: '/board/comment/'+bbs_id+'?replyst='+replyst,
                success : function(result){
                    alert(result)
                    relocateCmt();
                    relocateCn();
                    readStatus = false;
                    showList(pdt_id);
                },
                error   : function(){ alert("error") }
            });
        });

        $("#board").on("click", ".aw_mod_btn", function(){
            let bbs_id = $(this).attr("data-bbs_id");
            let inq_ans = $(".Inq_answer").text();
            $(".Inq_answer").text("");
            $("#rep_textarea").val(inq_ans);
            $("#rep_textarea").attr("style", "display:block");
            $(".aw_mod_btn").attr("style", "display:none");
            $(".aw_wrt_btn").attr("style", "display:block");
            $(".area_close").attr("style", "display:block");

            $(".area_close").click(function(){
                areaclose();
                $(".Inq_answer").text(inq_ans);
            })
            $(".aw_wrt_btn").click(function(){
                let inq_ans = $("#rep_textarea").val();

                if(inq_ans.trim()==''){
                    alert("답변을 입력해주세요.");
                    $("#rep_textarea").focus()
                    return;
                }
                $.ajax({
                    type:'PATCH',
                    url: '/board/comment/'+bbs_id,
                    headers : { "content-type": "application/json"},
                    data : JSON.stringify({inq_ans: inq_ans}),
                    success : function(result){
                        alert(result);
                        relocateCmt();
                        relocateCn();
                        readStatus = false;
                        showList(pdt_id);
                    },
                    error : function(){ alert("error")}
                });
            })

        });

    });
</script>
</body>
</html>