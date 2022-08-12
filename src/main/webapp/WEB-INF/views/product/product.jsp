<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 읽기</title>
</head>
<body>
<h2>상품 읽기</h2>
<form action="" id="form">

    <input type="text" name="pdt_id" value="${ProductDto.pdt_id}" readonly="readonly">
    <input type="text" name="price" value="${ProductDto.price}" readonly="readonly">
    <input type="text" name="ds_rate" value="${ProductDto.ds_rate}" readonly="readonly">
    <input type="text" name="sel_price" value="${ProductDto.sel_price}" readonly="readonly">
    <input type="text" name="title" value="${ProductDto.title}" readonly="readonly">
    <button type="button" id="removeBtn" class="btn">삭제</button>
    <button type="button" id="modifyBtn" class="btn">수정</button>
    <button type="button" id="writeBtn" class="btn">등록</button>
</form>
</body>
</html>