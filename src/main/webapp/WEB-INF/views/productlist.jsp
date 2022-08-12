<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevKurly</title>

</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">DevKurly</li>
        <li><a href="<c:url value='/'/>">Home</a></li>

        <li><a href=""><i class="fas fa-search small"></i></a></li>
    </ul>
</div><div style="text-align:center">
    <h2>화면테스트</h2>
    <form action="" id="form">

    </form>
    <table bord er="1">
        <tr>
            <th>상품아이디</th>
            <th>제목</th>
            <th>할인율</th>
            <th>판매가격</th>
            <th>가격</th>
            <th>소제목</th>
        </tr>
        <c:forEach var="ProductDto" items="${list}">
            <tr>
                <td>${ProductDto.pdt_id}</td>
                <td><a href="<c:url value="/product/read?pdt_id=${ProductDto.pdt_id}"/>"> <c:out value="${ProductDto.title}"/></a></td>
                <td>${ProductDto.title}</td>
                <td>${ProductDto.ds_rate}</td>
                <td>${ProductDto.sel_price}</td>
                <td>${ProductDto.price}</td>
                <td>${ProductDto.sub_title}</td>
            </tr>
        </c:forEach>
    </table>
    <br><br>
    <div>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        </c:forEach>
    </div>
</div>
</body>
</html>