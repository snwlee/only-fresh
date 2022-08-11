<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
    <table border="1">
        <tr>

            <th>가격</th>
            <th>할인율</th>
            <th>판매가격</th>
            <th>제목</th>
            <th>소제목</th>
        </tr>
        <c:forEach var="product" items="${list}">
        <tr>
            <td>${product_tb.price}</td>
            <td>${product_tb.ds_rate}</td>
            <td>${product_tb.sel_price}</td>
            <td>${product_tb.title}</td>
            <td>${product_tb.sub_title}</td>

        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>