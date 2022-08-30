<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OnlyFresh :: </title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">Devkurly</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='/login/login'/>">login</a></li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
    </ul>
</div><div style="text-align:center">
    <table border="1">
        <tr>
            <th>id</th>
            <th>이메일</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>성별</th>
            <th>생년월일</th>
        </tr>
        <c:forEach var="userDto" items="${list}">
        <tr>
            <td>${userDto.user_id}</td>
            <td><a href="<c:url value="/user/read/mod?user_id=${userDto.user_id}&page=${page}&pageSize=${pageSize}"/>"><c:out value="${userDto.user_email}"/></a></td>
            <td>${userDto.pwd}</td>
            <td>${userDto.user_nm}</td>
            <td>${userDto.gender}</td>
            <td>${userDto.bryr}</td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>