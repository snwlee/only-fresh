<%@ page contentType="text/html;charset=UTF-8" %>
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
    <h2>상품 리스트</h2>
    <form action="" id="form">

    </form>
    <button type="button" id="writeBtn" onclick="location.href='<c:url value="/product/write"/>'">상품등록</button>
    <table border="1">
        <tr>
            <th>제품명</th>
            <th>할인율</th>
            <th>판매가격</th>
            <th>가격</th>
            <th>소제목</th>
        </tr>
        <c:forEach var="ProductDto" items="${list}">
            <tr>
                <td><a href="<c:url value="/product/read?pdt_id=${ProductDto.pdt_id}"/>"> <c:out value="${ProductDto.title}"/></a></td>
                <td>${ProductDto.ds_rate}</td>
                <td>${ProductDto.sel_price}</td>
                <td>${ProductDto.price}</td>
                <td>${ProductDto.sub_title}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
</div>
<script>
   let msg = "${param.msg}"
   if(msg=="WRT_OK")alert("성공적으로 등록되었습니다.");
        if(msg=="DEL_OK")alert("성공적으로 삭제되었습니다.");
        if(msg=="DEL_ERROR")alert("삭제에 실패했습니다.")
</script>
       </body>
</html>