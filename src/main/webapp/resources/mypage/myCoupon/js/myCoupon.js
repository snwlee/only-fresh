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
        tmp += '&page=1&pageSize=12&order_sc=in_date&asc=sel_price%20ASC"<li class="cat main_cat">'
        tmp += el.cd_name
        tmp += '</li></a>'
    })

    return tmp;
}
// 여기까지 카테고리

let dateParse = function (str) {
    let y = str.substring(0, 4),
        m = str.substring(4, 6),
        d = str.substring(6, 8);
    return y + "년 " + m + "월 " + d + "일";
}

let isExpired = function (str) {
    let y = str.substring(0, 4),
        m = str.substring(4, 2),
        d = str.substring(6, 2);

    return new Date(y, m, d) < new Date(0);
}

let toCouponHtml = function (res) {
    let tmp = '';

    res.forEach(el => {
        tmp += '<div class="coupon cols">'
        tmp += '<div class="coupon_name first_col"> <h4>'
        tmp += el.nm
        tmp += '</h4><p>최대 '
        tmp += el.ds_max_posbl_amt.toLocaleString()
        tmp += '원 할인</p> <p>'
        tmp += (el.lmtt_cnd == null ? "" : el.lmtt_cnd)
        tmp += '</p> </div><div class="coupon_func second_col col">'
        tmp += el.func + '</div><div class="coupon_rate third_col col">'
        tmp += el.value + `${el.unit_type ? "%" : " 원"}`
        tmp += '</div><div class="coupon_due fourth_col col">'
        tmp += dateParse(el.expi_dd)
        tmp += '까지</div><div class="coupon_used fifth_col col">'
        tmp += (el.used ? "사용" : "미사용")
        tmp += '</div></div>';
    })

    return tmp;
}

let coupon_container = {};

let onOff = true;

$(".is_used_tabs").click((e) => {
    let coupons = $("#coupons");

    onOff = !onOff;

    if (onOff) {
        $("#unused_coupons").css("background-color", "#dddddd");
        $("#used_coupons").css("background-color", "white")
    } else {
        $("#unused_coupons").css("background-color", "white");
        $("#used_coupons").css("background-color", "#dddddd")
    }

    if (coupon_container[e.currentTarget.id].length === 0) {
        coupons.html("<div class='no_coupon_box'>쿠폰이 없습니다!</div>");
        return;
    } else if (e.currentTarget.innerText === "사용 가능 쿠폰") {
        coupons.html(toCouponHtml(coupon_container.unused_coupons));
        return;
    }
    coupons.html(toCouponHtml(coupon_container.used_coupons));
})

$(document).ready(() => {
        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/mypage/coupon',  // 요청 URI
            success: function (result) {
                if (!result.false) {
                    coupon_container.unused_coupons = [];
                    $("#coupons").html("<div class='no_coupon_box'>쿠폰이 없습니다!</div>");
                } else {
                    coupon_container.unused_coupons = result.false;
                    $("#optional_function").html(`사용 가능 쿠폰 ${result.false.length} 장`);
                    $("#coupons").html(toCouponHtml(result.false));
                }

                if (!result.true) {
                    coupon_container.used_coupons = [];
                } else {
                    coupon_container.used_coupons = result.true;
                }
            },
            error: function () {
                alert("쿠폰 불러오기 실패");
            } // 에러가 발생했을 때, 호출될 함수
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

        //검색
        $("#search_btn").click(function () {
            let keyword = $("#keyword").val();
            window.location.href = '/product/newlist?sort=1&keyword=' + keyword + '&page=1&pageSize=12&order_sc=in_date';
        });
        $("input[id=keyword]").keydown(function (key) {
            if (key.keyCode == 13)
                $("#search_btn").trigger("click");
        }); //검색 끝

        let url = window.location.href;
        $("#coupn_to_add").val(url.split("?")[url.length]);
    }
)

let addCoupon = function () {
    let nm = encodeURI($("#coupn_to_add").val());

    if (nm !== "") {
        $.ajax({
            type: 'POST',       // 요청 메서드
            url: '/mypage/coupon?nm=' + nm,  // 요청 URI
            success: function (res) {
                window.location.reload();
            },
            error: function (res) {
                if (res.status === 400) {
                    alert("쿠폰 이름을 잘못 입력하였습니다")
                } else {
                    alert("서버에 문제가 있습니다");
                }
            } // 에러가 발생했을 때, 호출될 함수
        })
    } else {
        alert("등록할 쿠폰의 이름을 넣어주세요!");
    }
}