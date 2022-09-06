let showList = function(){
    $.ajax({
        type:'GET',
        url: '/board_admin?page='+page+'&pageSize='+pageSize,
        success : function(result){
            $("#board").html(toHtml(result));
        },
        error   : function(){ alert("error") }
    });
}
let toHtml =function(lists){
    let tmp = "";
    lists.forEach(function(BoardDto){
        if(BoardDto.is_replied==true){
            BoardDto.is_replied = "답변완료";
        } else if(BoardDto.is_replied==false){
            BoardDto.is_replied = "답변대기";
        }
        if(BoardDto.is_secret)
            BoardDto.bbs_title =(BoardDto.bbs_title+' <img style="width: 15px" src="/product_detail/imgs/lock-icon.png"/>');
        tmp += '<table class="tb1" width="100%" cellpadding="0" cellspacing="0">'
        tmp += '<colgroup>'
        tmp += '<col style="width:70px;">'
        tmp += '<col style="width:70px;">'
        tmp += '<col style="width:auto;">'
        tmp += '<col style="width:77px;">'
        tmp += '<col style="width:100px;">'
        tmp += '<col style="width:80px;">'
        tmp += '</colgroup>'
        tmp += '<tbody>'
        tmp += '<tr>'
        tmp += '<td class="no">'+BoardDto.bbs_id+'</td>'
        tmp += '<td class="pdt_id">'+BoardDto.pdt_id+'</td>'
        tmp += '<td class="title">'
        tmp += '<div class="title_btn" data-bbs_id ='+BoardDto.bbs_id+ '><dt class="title_cn" data-secret ='+BoardDto.is_secret+' data-id ='+BoardDto.user_id+' data-bbs_id ='+BoardDto.bbs_id+'>'+BoardDto.bbs_title+'</dt></div>'
        tmp += '</td>'
        tmp += '<td class="writer">'+BoardDto.user_nm+'</td>'
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
let regExp = /[\{\}\[\]\/;|\)*~`^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;

function characterCheck(obj){
    // 허용하고 싶은 특수문자가 있다면 여기서 삭제하면 됨
    if( regExp.test(obj.value) ){
        alert("특수문자는 입력하실수 없습니다.");
        obj.value = obj.value.substring( 0 , obj.value.length - 1 );
    }
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
    $(".rep_btn").attr("style", "display:none");
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

let resetButtons = function(){
    $(".rep_btn").attr("style", "display:none");
    $(".mod_btn").attr("style", "display:none");
    $(".del_btn").attr("style", "display:none");
    $(".aw_wrt_btn").attr("style", "display:none");
    $(".aw_mod_btn").attr("style", "display:none");
    $(".aw_del_btn").attr("style", "display:none");
    $(".area_close").attr("style", "display:none");
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


$(document).ready(() => {
        showList();
        let readStatus = false;
        resetButtons();
        console.log(user_cls_cd);
        if(user_cls_cd!=='1') {
            alert("관리자용 페이지입니다. 접근할 수 없습니다.")
            window.parent.location.href = "/members";
        }

        $("#board").on("click", ".title_cn", function() {
            if (!readStatus) {
                let bbs_id = $(this).attr("data-bbs_id");
                let writer_id = $(this).attr("data-id");
                if($(this).attr("data-secret")==="true"){
                    if(writer_id!=user_id){
                        if(!(user_cls_cd==='1'))
                            return;
                    }
                }
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
                            $("#answer_mark").attr("style", "display:block");
                        }else{
                            $(".Inq_answer").text("");
                            $("#answer_mark").attr("style", "display:none");
                        }

                        if(memberResponse!==''){
                            if(writer_id===user_id){
                                $(".mod_btn").attr("style", "display:block");
                                $(".del_btn").attr("style", "display:block");
                            }
                            if(user_cls_cd==='1'){
                                if(result.commentDto!=null){
                                    $(".aw_mod_btn").attr("style", "display:block");
                                    $(".aw_del_btn").attr("style", "display:block");
                                }
                                else{
                                    $(".rep_btn").attr("style", "display:block");
                                }
                            }
                        }
                    },
                    error: function () {
                        alert("error")
                    }
                });
                locateCn(bbs_id);
            } else {
                $("#rep_textarea").val("");
                $("#rep_textarea").attr("style", "display:none");
                relocateCn();
                readStatus = false;
                resetButtons();
            }
        });

        // $(".p_write_btn").click(function(){
        //     $(".modal").css("display","flex");
        // })
        //
        // $(".close").click(function(){
        //     $(".modal").css("display","none");
        //     deleteModalValue();
        // });
        //
        // $(".btn-cancel").click(function(){
        //     $(".modal").css("display","none");
        //     deleteModalValue();
        // });

        // $("#board").on("click", ".del_btn", function(){
        //     let bbs_id = $(this).attr("data-bbs_id");
        //     if(!confirm("정말로 글을 삭제하시겠습니까?")) return;
        //     $.ajax({
        //         type:'DELETE',
        //         url: '/board/'+bbs_id+'?pdt_id='+pdt_id,
        //         error   : function(){ alert("error") }
        //     });
        //     alert("글이 삭제되었습니다.");
        //     window.location.href = "/boardlist?pdt_id="+pdt_id+"&bbs_clsf_cd="+bbs_clsf_cd+"&page=1&pageSize=10";
        // });

        // $("#board").on("click", ".mod_btn", function(e){
        //     let target = e.target;
        //     let bbs_id = target.getAttribute("data-bbs_id");
        //
        //     let div = $("div[data-bbs_id="+bbs_id+"]");
        //     let bbs_title = $(".title_cn", div).first().text();
        //     let bbs_cn = $(".review_content", div).first().text();
        //
        //     $("#myModal #bbs_title").val(bbs_title);
        //     $("#myModal #contents").val(bbs_cn);
        //     $("#myModal .btn-write").attr('class',"btn-modify");
        //     $("#myModal .btn-modify").text("수정");
        //     $("#myModal .btn-modify").attr("data-bbs_id", bbs_id);
        //
        //     $(".modal").css("display","flex");
        //
        // });

        // $("#myModal").on("click", ".btn-modify", function(){
        //     let bbs_title = $("#myModal #bbs_title").val();
        //     let bbs_cn = $("#myModal #contents").val();
        //     let bbs_id = $(this).attr("data-bbs_id");
        //
        //     let secretvalue = $("input:checkbox[name='secret1']:checked").val();
        //     let is_secret = secretvalue == "true";
        //
        //     if(bbs_cn.trim()==''|bbs_title.trim()==''){
        //         alert("제목 또는 내용을 입력해주세요.");
        //         $("#myModal #contents").focus()
        //         return;
        //     }
        //     if(regExp.test(bbs_title)||regExp.test(bbs_cn)) {
        //         alert("제목 또는 내용에 허용되지 않은 특수문자를 지워주세요.");
        //         return;
        //     }
        //     $.ajax({
        //         type:'PATCH',
        //         url: '/board/'+bbs_id+'?pdt_id='+pdt_id,
        //         headers : { "content-type": "application/json"},
        //         data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn, is_secret:is_secret}),
        //         error   : function(){ alert("error") }
        //     });
        //     $(location).prop("href", location.href);
        //     alert("글이 수정되었습니다.");
        // });

        $("#board").on("click", ".rep_btn", function(){
            locateCmt();

            $(".aw_wrt_btn").click(function(){
                let inq_ans = $("#rep_textarea").val();
                let bbs_id = $(this).attr("data-bbs_id");
                let replyst = 1;
                if(regExp.test(inq_ans)) {
                    alert("답글에 허용되지 않은 특수문자를 지워주세요.");
                    return;
                }
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
                    error   : function(){ alert("error") }
                });
                $(location).prop("href", location.href);
                alert("댓글이 등록되었습니다.");
            });
            $(".area_close").click(function(){
                $("#rep_textarea").attr("style", "display:none");
                $(".rep_btn").attr("style", "display:block");
                $(".aw_wrt_btn").attr("style", "display:none");
                $(".area_close").attr("style", "display:none");
            });
        });

        $("#board").on("click", ".aw_del_btn", function(){
            let bbs_id = $(this).attr("data-bbs_id");
            let replyst = 0;
            if(!confirm("정말로 답변을 삭제하시겠습니까?")) return;
            $.ajax({
                type:'DELETE',
                url: '/board/comment/'+bbs_id+'?replyst='+replyst,
                error   : function(){ alert("error") }
            });
            $(location).prop("href", location.href);
            alert("댓글이 삭제되었습니다.");
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
                if(regExp.test(inq_ans)) {
                    alert("답글에 허용되지 않은 특수문자를 지워주세요.");
                    return;
                }
                $.ajax({
                    type:'PATCH',
                    url: '/board/comment/'+bbs_id,
                    headers : { "content-type": "application/json"},
                    data : JSON.stringify({inq_ans: inq_ans}),
                    error : function(){ alert("error")}
                });
                $(location).prop("href", location.href);
                alert("댓글이 수정되었습니다.");
            })
        });


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
    }
)

//검색
$("#search_btn").click(function(){
    let keyword = $("#keyword").val();
    window.location.href = '/product/newlist?sort=1&keyword='+keyword+'&page=1&pageSize=12&order_sc=in_date';
});
$("input[id=keyword]").keydown(function (key){
    if(key.keyCode==13)
        $("#search_btn").trigger("click");
}); //검색 끝