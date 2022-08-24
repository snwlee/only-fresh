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
        <div id="address" style="text-align: center">
            <table border="1">
            <tr id="title">
                <th>배송지 관리</th>
                <th>배송지</th>
<%--                <th><a href="<c:url value='/address/newAddr'/>">새 배송지 추가</a></th>--%>
                <th><input type="button" value="새 배송지 추가" onclick="kakaopost()"></th>
            </tr><br>
            <tr>
                <th>배송지번호</th>
                <th>선택</th>
                <th>주소</th>
                <th>받으실 분</th>
                <th>연락처</th>
                <th>배송유형</th>
                <th><input type="button" value="modBtn" name="modify"></th>
            </tr>
                    <c:forEach var="addressDto" items="${list}">
                        <tr>
                            <th>${addressDto.addr_id}</th>
                            <th>${addressDto.user_id}</th>
                            <th>${addressDto.chk_addr}</th>
                            <th>${addressDto.stna_addr}</th>
                            <th>${addressDto.stna_addr_dt}</th>
<%--                            <th><input type="button" value="modBtn"></th>--%>
                        </tr>
                    </c:forEach>
            </table>
        </div>
        <script>
            $(document).ready(function (){
               $('#modBtn').on("click", function (){
                  location.href="<c:url value='/address/modify'/>";
               });
            });
        </script>
        <%-- 카카오 API --%>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            function kakaopost(){
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                        document.querySelector("#zipcode").value = data.zonecode;
                    }
                }).open();
            }
        </script>
</body>
</html>
