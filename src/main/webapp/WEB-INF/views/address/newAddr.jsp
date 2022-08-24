<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>카카오 우편번호 API TEST</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                document.querySelector("#zipcode").value = data.zonecode;
            }
        }).open();
    </script>
<head>
    <meta charset="UTF-8">
    <title>카카오 우편번호 API TEST</title>
</head>
<body>
<table border="1">
    <tr>
        <td width="200">우편번호</td>
        <td>
<%--          <%-- 우편번호 : zipcode, 주소 : address --%>
            <input type="text" name="zipcode" id="zipcode" size="7">
            <input type="button" value="우편번호찾기" onclick="kakaopost()">
        </td>
    </tr>
    <tr>
        <td>주소</td>
        <td>
            <input type="text" name="address" id="address" size="70">
        </td>
    </tr>
</table>
</body>
