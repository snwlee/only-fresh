<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록</title>
<%@ include file="/WEB-INF/views/admin/user_header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/user_border.jsp" %>
    <h2>회원 목록</h2>
    <input type="button" value="회원등록" onclick="location.href='${path}/admin/write.do'">
    <table border="1" width="700px">
        <tr>
            <th>id</th>
            <th>이름</th>
            <th>이메일</th>
            <th>가입일</th>
            <th>성별</th>
            <th>생년월일</th>
        </tr>
        <c:forEach var="row" items="${list}">
        <tr>
            <td>${UserDto.user_id}</td>
            <td><a href="${path}/admin/view.do?user_id=${UserDto.user_id}">${UserDto.user_nm}</a></td>
            <td>${UserDto.user_email}</td>
            <td>${UserDto.subs_dt}</td>
            <td>${UserDto.gender}</td>
            <td>${UserDto.bryr}</td>
        </tr>
        </c:forEach>
    </table>
</body>
</html>