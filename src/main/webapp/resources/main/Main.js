    let showList = function(){
    let sort = 0
    $.ajax({
    type: 'GET',
    url: '/product/call?sort='+sort+'&order_sc=""',
    success : function(result){
    $("#product").html(toHtml(result.list1));
    $("#product2").html(toHtml(result.list2));
    $("#product3").html(toHtml(result.list3));
    $("#product4").html(toHtml(result.list4));
    $("#product5").html(toHtml(result.list5));
},
    error : function(){alert("error")}
});
}
    let toHtml = function(lists){
    let tmp = "";
    lists.forEach(function(ProductDto){
    tmp += '<div class="products">'
    tmp += '<a href="/detail?pdt_id='+ProductDto.pdt_id+'"><img id="img" src="'+ProductDto.image+'"/></a>'
    tmp += '<h3 class="product_title">['+ProductDto.company +'] '+ProductDto.title+'<h3/>'
    tmp += '<div class="product"><span class="product_ds_rate">'+ProductDto.ds_rate+'%</span>'
    tmp += '<span class="product_sel_price">'+ProductDto.sel_price.toLocaleString()+'원</span></div>'
    tmp += '<span class="product_price">'+ProductDto.price.toLocaleString()+'원</span></div>'
})
    return tmp;
}
    $(document).ready(function () {
    showList();

})
