let wrapper = $("#cat_wrapper");
let show_category_button = $("#show_category_button");
let main_cat_container = $("#main_cat_container");
let sub_cat_container = $("#sub_cat_container");
let sub_cat = $(".sub_cat");
let page = ${param.page};
let pageSize = ${param.pageSize};
let bbs_clsf_cd = '2';
let user_id = '<c:out value="${sessionScope.memberResponse.user_id}"/>';

let showList = function(){
    $.ajax({
        type:'GET',
        url: '/getMyList?bbs_clsf_cd='+bbs_clsf_cd+'&page='+page+'&pageSize='+pageSize+'&user_id='+user_id,
        success : function(result){
            $("#list_container").html(toHtml(result));
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
            BoardDto.bbs_title =('<p style="color:#b5b5b5">비밀글입니다.</p>');
        tmp += '<div class="cols">'+BoardDto.pdt_id+''
        tmp += '<div class="title_btn" data-bbs_id ='+BoardDto.bbs_id+ '><dt class="title_cn" data-secret ='+BoardDto.is_secret+' data-id ='+BoardDto.user_id+' data-bbs_id ='+BoardDto.bbs_id+'>'+BoardDto.bbs_title+'</dt></div>'
        tmp += '<div class="reg_date">'+dateToString(BoardDto.wrt_dt)+'</div>'
        tmp += '<div class="reply_status" style="text-align: center">'+BoardDto.is_replied+'</div></div>'

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

let relocateCn = function(){
    $("#review_view").css("display", "none");
    $(".review_content").text('');
    $("#review_view").appendTo(".p_write_btn");
};

let locateCn = function(bbs_id){
    $("#review_view").appendTo($("div[data-bbs_id=" + bbs_id + "]"));
    $("#review_view").css("display", "block");
}

let categories = null;

$(document).ready(function(){
    showList();
    let readStatus = false;

    $("#list_container").on("click", ".title_cn", function() {
        if (!readStatus) {
            let bbs_id = $(this).attr("data-bbs_id");
            readStatus = true;
            $.ajax({
                type: 'GET',
                url: '/board/'+bbs_id+'?bbs_clsf_cd='+bbs_clsf_cd,
                headers: {"content-type": "application/json"},
                success: function (result) {
                    $(".review_content").text(result.boardDto.bbs_cn);

                    if(result.commentDto!=null){
                        $(".Inq_answer").text(result.commentDto.inq_ans);
                        $("#answer_mark").attr("style", "display:block");
                    }else{
                        $(".Inq_answer").text("");
                        $("#answer_mark").attr("style", "display:none");
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
        }
    });

    $.ajax({
        type: 'GET',       // 요청 메서드
        url: '/product/categories',  // 요청 URI
        success: function (res) {
            categories = res;

            $.each(res, (el) => {
                $("#main_cat_container").append('<a href="/product/newlist?cd_type_name=' + el + '&page=1&pageSize=12"<li class="cat main_cat">' + el + '</li></a>');
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
});