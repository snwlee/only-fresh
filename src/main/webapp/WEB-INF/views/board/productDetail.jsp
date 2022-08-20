<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page session="true"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="productDetail">
    <div class="pdt_img"></div>
    <div id="details">
        <div id="price_container">
            <div class="de_type">배송 : ${productDto.de_type}</div>
            <div class="title">제조사 : ${productDto.company} , 제목 : ${productDto.title}</div>
            <div class="sub_title">소제목: ${productDto.sub_title}</div>
            <div class="price">
                <div class="ds_rate">할인율 : ${productDto.ds_rate}%</div>
                <div class="sel_price">판매가격 : ${productDto.sel_price}원</div>
                <div class="price">원가격 : ${productDto.price}원</div>
            </div>
        </div>
        <div>
            <div class="de_type">배송 : ${productDto.de_type}</div>
            <div class="seller">판매자 : 컬리</div>
            <div class="pack_cd">포장타입 : ${productDetailDto.pack_cd}</div>
            <div class="sell_cd">판매단위 : ${productDetailDto.sell_cd}</div>
            <div class="weca_cd">중량/용량 : ${productDetailDto.weca_cd}</div>
            <div class="origin">원산지 : ${productDetailDto.origin}</div>
            <div class="allg_dt">알레르기 정보 : ${productDetailDto.allg_dt}</div>
            <div class="ex_dt">유통기한 : ${productDetailDto.ex_dt}</div>
            <div class="notice">안내사항 : ${productDetailDto.notice}</div>
        </div>
    </div>
</div>
</body>
</html>