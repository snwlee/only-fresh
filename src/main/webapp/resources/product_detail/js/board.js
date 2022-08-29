let pdt_id = ${param.pdt_id};
let page = ${param.page};
let pageSize = ${param.pageSize};
let bbs_clsf_cd = ${param.bbs_clsf_cd};
let user_id = '<c:out value="${sessionScope.memberResponse.user_id}"/>';
let sortType = '<c:out value="${param.sortType}"/>';
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
        tmp += '<td class="grade" ></td>'
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
    showList(pdt_id,sortType);
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
        location.href = '/boardlist?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd+'&page='+page+'&pageSize='+pageSize+'&sortType='+sortType;
    });

    $(".p_write_btn").click(function(){
        $.ajax({
            type:'GET',
            url: '/chkOrder?user_id='+user_id,
            success : function(result){
                for (let i = 0; i < result.length; i++) {
                    console.log(result[i].pdt_id);
                    if(pdt_id==result[i].pdt_id){
                        $(".modal").css("display","flex");
                        return;
                    }
                }
                alert("구입한 상품만 후기를 작성할 수 있습니다.");
            },
            error   : function(){ alert("error") }
        });
    })

    $("#myModal").on("click", ".btn-write", function(){
        let bbs_title = $("#myModal #bbs_title").val();
        let bbs_cn = $("#myModal #contents").val();

        if(bbs_cn.trim()==''|bbs_title.trim()==''){
            alert("제목 또는 내용을 입력해주세요.");
            $("#myModal #contents").focus()
            return;
        }
        if(regExp.test(bbs_title)||regExp.test(bbs_cn)) {
            alert("제목 또는 내용에 허용되지 않은 특수문자를 지워주세요.");
            return;
        }
        $.ajax({
            type:'POST',
            url: '/board?pdt_id='+pdt_id+'&bbs_clsf_cd='+bbs_clsf_cd,
            headers : { "content-type": "application/json"},
            data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn}),
            error   : function(){ alert("error") }
        });
        $(location).prop("href", location.href);
        alert("글이 작성되었습니다.");
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
            error   : function(){ alert("error") }
        });
        $(location).prop("href", location.href);
        alert("글이 삭제되었습니다.");
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
        if(regExp.test(bbs_title)||regExp.test(bbs_cn)) {
            alert("제목 또는 내용에 허용되지 않은 특수문자를 지워주세요.");
            return;
        }
        $.ajax({
            type:'PATCH',
            url: '/board/'+bbs_id+'?pdt_id='+pdt_id,
            headers : { "content-type": "application/json"},
            data : JSON.stringify({bbs_title:bbs_title, bbs_cn:bbs_cn}),
            error   : function(){ alert("error") }
        });
        $(location).prop("href", location.href);
        alert("글이 수정되었습니다.");
    });

    if(${sessionScope.memberResponse !=null}) {
        $("#board").on("click", ".like_button", function () {
            let bbs_id = $(this).attr("data-bbs_id");
            let likeUpDown = 1;
            $.ajax({
                type: 'PATCH',
                url: '/like/' + bbs_id+'?likeUpDown='+likeUpDown,
                success: function (result) {
                    relocateCn();
                    readStatus = false;
                    showList(pdt_id);
                },
                error : function(){
                    if (!confirm("이미 추천하신 리뷰입니다. 추천을 취소하시겠습니까?")){
                        return;
                    }else{
                        let likeUpDown = -1;
                        $.ajax({
                            type: 'PATCH',
                            url: '/like/' + bbs_id+'?likeUpDown='+likeUpDown,
                            success: function (result) {
                                relocateCn();
                                readStatus = false;
                                showList(pdt_id);
                            },
                            error : function(){ alert("추천 취소 ERROR")}
                        });
                    }
                }
            });
        });
    }
});