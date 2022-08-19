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
            <div class="de_type">배송 : ${ProductDto.de_type}</div>
            <div class="title">제조사 : ${ProductDto.company} , 제목 : ${ProductDto.title}</div>
            <div class="sub_title">소제목: ${ProductDto.sub_title}</div>
            <div class="price">
                <div class="ds_rate">할인율 : ${ProductDto.ds_rate}%</div>
                <div class="sel_price">판매가격 : ${ProductDto.sel_price}원</div>
                <div class="price">원가격 : ${ProductDto.price}원</div>
            </div>
        </div>
        <div>
            <div class="de_type">배송 : ${ProductDto.de_type}</div>
            <div class="seller">판매자 : 컬리</div>
            <div class="pack_cd">포장타입 : </div>
            <div class="sell_cd">판매단위 : </div>
            <div class="weca_cd">중량/용량 : </div>
            <div class="origin">원산지 : </div>
            <div class="allg_dt">알레르기 정보 : </div>
            <div class="ex_dt">유통기한 : </div>
            <div class="notice">안내사항 : </div>
        </div>
    </div>
</div>
</body>
</html>