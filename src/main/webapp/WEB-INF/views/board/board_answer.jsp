<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 게시판</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <style>
        .title {
            padding-left: 50px;
            text-align: left;
        }

        #review_view {
            display: none;
            padding: 10px 10px 11px;
            border-top: 1px solid #e3e3e3;
        }

        .review_board #review_view .review_content {
            width: 100%;
            padding: 20px 9px 9px;
            line-height: 25px
        }

        .review_board #review_view .Inq_answer{
            width: 100%;
            padding: 20px 9px 9px;
            line-height: 25px
        }

        .review_board .tb1 .title {
            padding-left: 50px;
            text-align: left;
        }

        .p_write_btn {float:right}

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
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            padding-top: 10px;
            /* Location of the box */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }
        .modal-dialog{
            display: flex;
        }
        .modal-content{
            margin: auto;
        }

    </style>
</head>
<body>
<div class="inquiry_board">
    <div class="board">
        <div class="title"></div>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <colgroup>
                <col style="width:70px;">
                <col style="width:auto;">
                <col style="width:51px;">
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
    <p class="p_write_btn">
        <button type="button" class="modal_write">문의하기</button>
    <div id="review_view">
        <div class="review_content"></div>
        <br>
        <div id="buttons">
            <button type="button" class="rep_btn">답변하기</button>
            <button type="button" class="mod_btn">수정</button>
            <button type="button" class="del_btn">삭제</button>
        </div>
        <div>
            <div class="Inq_answer"></div>
            <textarea id="rep_textarea" rows="10" cols="100" style="display:none"></textarea>
            <div>
                <button type="button" class="aw_wrt_btn" style="display:none">등록</button>
                <button type="button" class="aw_mod_btn" style="display:none">수정</button>
                <button type="button" class="aw_del_btn" style="display:none">삭제</button>
                <button type="button" class="area_close" style="display:none">닫기</button>

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
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="modal-title" class="modal-title">상품 문의하기</h4>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <tr>
                            <td>제목</td>
                            <td><input class="form-control" id="bbs_title" type="text" placeholder="제목을 입력해주세요"></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea class="form-control" id="contents" rows="10" placeholder="내용을 입력해주세요"></textarea></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <label><input type="checkbox" name="secret1" value="true">비밀글로 문의하기</label>
                    <button id="modalSubmit" type="button" class="btn-write">등록</button>
                    <button type="button" class="btn-cancel" data-dismiss="modal">취소</button>
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
    <%--let user_id = ${sessionScope.user_id};--%>
    let user_id = 1; //임시 하드코딩

    let showList = function(pdt_id){
        $.ajax({
            type:'GET',
            url: '/dev_kurly/board?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd+'&page='+page+'&pageSize='+pageSize+'&sortType=',
            success : function(result){
                $("#board").html(toHtml(result));
            },
            error   : function(){ alert("error") }
        });
    }

    // if(BoardDto.user_cls_cd==true){
    //     if(BoardDto.user_id==user_id){
    //         BoardDto.title
    //     }else{
    //         "비밀글입니다."
    //     }
    // }


    //
    // 비밀글이면 관리자와 작성자를 제외한 유저들에게는 “비밀글입니다.”라는 글제목으로 링크를 없앤 채 회색글씨로 보이게 한다.
    let toHtml =function(lists){
        let tmp = "";
        lists.forEach(function(BoardDto){
            if(BoardDto.is_replied==true){
                BoardDto.is_replied = "답변완료";
            } else{
                BoardDto.is_replied = "답변대기";
            }
            tmp += '<table class="tb1" width="100%" cellpadding="0" cellspacing="0">'
            tmp += '<colgroup>'
            tmp += '<col style="width:70px;">'
            tmp += '<col style="width:auto;">'
            tmp += '<col style="width:51px;">'
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
            tmp += '<td class="writer">'+BoardDto.user_nm+'</td>'
            tmp += '<td class="reg_date">'+dateToString(BoardDto.wrt_dt)+'</td>'
            tmp += '<td class="reply_status">'+BoardDto.is_replied+'</td>'
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

    $(document).ready(function(){
        showList(pdt_id);
        let readStatus = false;

        $(".modal_write").click(function(){
            $(".modal").css("display","block");
        })

        $("#myModal").on("click", ".btn-write", function(){
            let bbs_title = $("#myModal #bbs_title").val();
            let bbs_cn = $("#myModal #contents").val();

            let secretvalue = $("input:checkbox[name='secret1']:checked").val();
            let is_secret = secretvalue == "true";
            console.log(is_secret);

            if(bbs_cn.trim()==''|bbs_title.trim()==''){
                alert("제목 또는 내용을 입력해주세요.");
                $("#myModal #contents").focus()
                return;
            }
            $.ajax({
                type:'POST',
                url: '/dev_kurly/board?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn, is_secret:is_secret}),
                success : function(result){
                    alert(result);
                    relocateCn();
                    readStatus = false;
                    showList(pdt_id);
                    deleteModalValue();
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
                    url: '/dev_kurly/board/' + bbs_id,
                    headers: {"content-type": "application/json"},
                    success: function (result) {
                        $(".del_btn").attr("data-bbs_id", bbs_id);
                        $(".mod_btn").attr("data-bbs_id", bbs_id);
                        $(".rep_btn").attr("data-bbs_id", bbs_id);
                        $(".aw_wrt_btn").attr("data-bbs_id", bbs_id);
                        $(".aw_mod_btn").attr("data-bbs_id", bbs_id);
                        $(".aw_del_btn").attr("data-bbs_id", bbs_id);
                        $(".area_close").attr("data-bbs_id", bbs_id);
                        $(".review_content").text(result.boardDto.bbs_cn);

                        if(result.commentDto!=null){
                            $(".Inq_answer").text(result.commentDto.inq_ans);
                            $(".rep_btn").attr("style", "display:none");
                            $(".aw_mod_btn").attr("style", "display:block");
                            $(".aw_del_btn").attr("style", "display:block");
                        }else{
                            $(".Inq_answer").text("");
                            $(".aw_mod_btn").attr("style", "display:none");
                            $(".aw_del_btn").attr("style", "display:none");
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
            }
        })

        $("#board").on("click", ".del_btn", function(){
            let bbs_id = $(this).attr("data-bbs_id");
            if(!confirm("정말로 글을 삭제하시겠습니까?")) return;
            $.ajax({
                type:'DELETE',
                url: '/dev_kurly/board/'+bbs_id+'?pdt_id='+pdt_id,
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

            $(".modal").css("display","block");

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
                url: '/dev_kurly/board/'+bbs_id+'?pdt_id='+pdt_id,
                headers : { "content-type": "application/json"},
                data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn}),
                success : function(result){
                    alert(result);
                    relocateCn();
                    readStatus = false;
                    showList(pdt_id);
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
                    url: '/dev_kurly/board/comment/'+bbs_id+'?replyst='+replyst,
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
                url: '/dev_kurly/board/comment/'+bbs_id+'?replyst='+replyst,
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

            $(".aw_wrt_btn").click(function(){
                let inq_ans = $("#rep_textarea").val();

                if(inq_ans.trim()==''){
                    alert("답변을 입력해주세요.");
                    $("#rep_textarea").focus()
                    return;
                }
                $.ajax({
                    type:'PATCH',
                    url: '/dev_kurly/board/comment/'+bbs_id,
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