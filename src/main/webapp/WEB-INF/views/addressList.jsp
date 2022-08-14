<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevKurly</title>
</head>
<body>
        <div id="address">
            <tr id="title">
                <th>배송지 관리</th>
                <th>배송지에</th>
                <th><a href="<c:url value='/address/newAddress'/>">새 배송지 추가</a></th>
            </tr><br>
            <tr>
                <th>배송지번호</th>
                <th>선택</th>
                <th>주소</th>
                <th>받으실 분</th>
                <th>연락처</th>
                <th>배송유형</th>
                <th>수정</th>

            </tr><br>
            <form action="" id="form">
                <input type="hidden" name="addr_id" value="${AddressDto.addr_id}" readonly="readonly">
                <input type="radio" name="chk_addr" value="${AddressDto.chk_addr}">
                <input type="text" name="stna_addr" value="${AddressDto.stna_addr}">
                <input type="text" name="addr_name" value="${AddressDto.addr_name}">
                <input type="text" name="addr_tel" value="${AddressDto.addra_tel}">
                <input type="text" name="de_type" value="${AddressDto.de_type}">
                <button type="button" id="updateBtn" class="btn">수정</button>
            </form>
        </div>
        <script>
            $(document).ready(function (){
               $('#updateBtn').on("click", function (){
                  location.href="<c:url value='/adress/addressUpdate'/>";
               });
            });
        </script>
</body>
</html>
