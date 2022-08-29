let page = '<c:out value="${param.page}"/>';
let pageSize = '<c:out value="${param.pageSize}"/>';
let sort = '<c:out value="${param.sort}"/>';
let cd_name_num = '<c:out value="${param.cd_name_num}"/>';
let cd_type_name = '<c:out value="${param.cd_type_name}"/>';
let order_sc = '${param.order_sc}';
let asc = '${param.asc}';
let keyword = '<c:out value="${ph.sc.keyword}"/>';

let showList = function () {
    $.ajax({
        type: 'GET',
        url: '/product/call?sort=' + sort + '&cd_name_num=' + cd_name_num + '&cd_type_name=' + cd_type_name + '&page=' + page + '&pageSize=' + pageSize + '&order_sc=' + order_sc + '&asc=' + asc + '&keyword=' + keyword,
        // http://localhost/product/newlist?page=1&pageSize=12&cd_name_num=1&cd_type_name=%27%EC%B1%84%EC%86%8C%27&sort=0
        success: function (result) {
            $("#product").html(toHtml(result.list)); // 상품 리스트를 가져온다.
            $("#cd_type_name").text(result.cd_type_name);
            $("#cd_name").text(result.cd_name); // 카테고리의 이름을 가져온다.
            $("#page_title").text(result.title); // 상품의 제목을 가져온다.
        },
        error: function () {
            // alert("error")
        }
    });
}

let toHtml = function (lists) {
    let tmp = "";
    lists.forEach(function (ProductDto) {
        tmp += '<div class="products">'
        tmp += '<a href="/detail?pdt_id=' + ProductDto.pdt_id + '"><img id="img" src="' + ProductDto.image + '"/></a>'
        tmp += '<span class="de_type">' + (ProductDto.de_type == true ? "샛별배송" : "낮배송") + '</span>'
        tmp += '<div class="product_title">' + ProductDto.title + '</div>'
        tmp += '<span class="product_ds_rate">' + ProductDto.ds_rate + '%' + '<span class="product_sel_price">' + ProductDto.sel_price.toLocaleString() + '원</span></span>'
        tmp += '<span class="product_price">' + ProductDto.price.toLocaleString() + '원</span>'
        tmp += '<span class="product_tag">' + ProductDto.tag_name + '</span></div>'
    })
    return tmp;
}


$(document).ready(function () {
    showList();
})

