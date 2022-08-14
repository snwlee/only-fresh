<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevKurly</title>

</head>
<body>
<style>
    p {
        display: inline;
    }

    li {
        display: inline-block;
    }

    a {
        color: green;
        text-decoration: none;
    }

    a:visited {
        text-decoration: none;
        color: green;
    }



</style>
<div id="container" style="width:100%; background-color:lightgrey; color:green; text-align:center">
    <ul>
        <li id="logo">DevKurly</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
        <li>
            <button type="button" id="writeBtn" onclick="location.href='<c:url value="/product/write"/>'">상품등록</button>
    </ul>
    <h2>상품 리스트</h2>
    <form action="" id="form">

        <table border="1">
            <c:forEach var="ProductDto" items="${list}">
            <a href="<c:url value="/carts/add/${ProductDto.pdt_id}"/>">장바구니에 추가</a>
            <a href="<c:url value="/product/read?pdt_id=${ProductDto.pdt_id}"/>"> <c:out value="${ProductDto.title}"/></a>
            <p>     ${ProductDto.ds_rate}%
                    ${ProductDto.sel_price}원
                    ${ProductDto.price}원
                    ${ProductDto.sub_title}
                    ${ProductDto.de_type}</p> <br>
            </c:forEach>
</div>
</table>
</form>
<script>
    let msg = "${param.msg}"
    if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
    if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
    if (msg == "DEL_ERROR") alert("삭제에 실패했습니다.")
</script>
</body>
</html>