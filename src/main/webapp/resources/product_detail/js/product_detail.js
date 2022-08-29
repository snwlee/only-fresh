let pdt_id = ${param.pdt_id};
let title = '${productDetailDto.title}';
let image = '${productDetailDto.image}';
let company = '[${productDetailDto.company}]';
//가격단위 콤마 추가
let sel_price = ${productDetailDto.sel_price};
let price = ${productDetailDto.price};
let priceLocale= sel_price.toLocaleString()
let priceLocale2= price.toLocaleString()
$("#sel_price").text(priceLocale);
$("#price").text(priceLocale2 + "원");
$("#actual_price").text(priceLocale);

/* 카테고리 */
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
let catToLi = function(res) {
    let tmp = '';
    res.forEach(el => {
        tmp += '<a href="/product/newlist?cd_name_num='+el.cd_name_num+'&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"<li class="cat main_cat">'+el.cd_name+'</li></a>'
    })
    return tmp;
}
let categories = null;
let regExp = /[`~!@#$%\-^&*|\\\'\";:\/?]/gi;

$(document).ready(function(){
    let jbOffset = $(".menu_nav").offset();
    $(window).scroll( function() {
        if ($(document).scrollTop() > jbOffset.top) {
            $(".menu_nav").css({"position":"fixed","top":"0px","left":"50%","transform":"translateX(-50%)"});
        }
        else {
            $(".menu_nav").css({"position":'relative'});
        }
    });

    $(".navi").click(function(event){

        event.preventDefault();
        let x= $(this).attr("value");
        $('html,body').animate({scrollTop:$(x).offset().top}, 500);

    });

    $("#add_coupon").click(function(){
        window.location.href ='/mypage?coupn_nm=나라사랑카드 쿠폰';
    })

    $("#down_qty").click(function(){
        if(parseInt($("#pdt_qty").text())>1)
            $("#pdt_qty").text(parseInt($("#pdt_qty").text())-1);
        $("#actual_price").text((parseInt($("#pdt_qty").text())*sel_price).toLocaleString());
    });

    $("#up_qty").click(function(){
        $("#pdt_qty").text(parseInt($("#pdt_qty").text())+1);
        $("#actual_price").text((parseInt($("#pdt_qty").text())*sel_price).toLocaleString());
    });

    $("#addCart").click(function(){
        let pdt_qty = parseInt($("#pdt_qty").text());
        if(pdt_qty==0){
            alert("구매수량이 0이면 장바구니에 넣을 수 없습니다.");
            return;
        }
        let testValue = $("#pdt_qty").text();
        if(regExp.test(testValue)||testValue.includes("-")){
            console.log("didn't pass the regExp test");
            alert("구매수량에 음수값이나 특수문자를 입력할 수 없습니다.");
            return;
        }
        $.ajax({
            type:'POST',
            url: '/carts/'+pdt_id+'?pdt_qty='+pdt_qty,
            success : function(result){

                const Toast = Swal.mixin({
                    toast: true,
                    position: 'center-center',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })

                Toast.fire({
                    icon: 'success',
                    title: '<img src="'+image+'" style="width: 50px; float: left; margin-right: 20px;" /><div style="width: 300px; text-align: left; margin-top: 12px; margin-bottom: 10px;      ">'+company + title +'<br>'+"장바구니에 상품이 추가되었습니다."+'</div>'
                })

            },
        });
    });
    $.ajax({
        type: 'GET',       // 요청 메서드
        url: '/product/categories',  // 요청 URI
        success: function (res) {
            categories = res;

            $.each(res, (el)=>{
                $("#main_cat_container").append('<a href="/product/newlist?cd_type_name='+el+'&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"<li class="cat main_cat">'+el+'</li></a>');
            })
        },
        error: function (result) {
            alert("쿠폰 불러오기 실패");
        }, // 에러가 발생했을 때, 호출될 함수
        complete: function(){
            $(".main_cat").mouseenter((e) => {
                sub_cat_container.show();
                sub_cat_container.html(catToLi(categories[e.currentTarget.innerText]));
            })
        }
    })
    //검색
    $("#search_btn").click(function(){
        let keyword = $("#keyword").val();
        window.location.href = '/product/newlist?sort=1&keyword='+keyword+'&page=1&pageSize=12&order_sc=in_date';
    });
    $("input[id=keyword]").keydown(function (key){
        if(key.keyCode==13)
            $("#search_btn").trigger("click");
    }); //검색 끝
});