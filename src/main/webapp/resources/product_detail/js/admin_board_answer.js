console.log(hi);
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