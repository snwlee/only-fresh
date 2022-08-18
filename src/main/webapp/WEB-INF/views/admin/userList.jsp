<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>fastcampus</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
</head>
<body>
<div id="menu">
    <ul>
        <li id="logo">fastcampus</li>
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
            <th>이름</th>
            <th>이메일</th>
            <th>가입일</th>
            <th>성별</th>
            <th>생년월일</th>
        </tr>
        <c:forEach var="USER_TB" items="${list}">
        <tr>
            <td>${USER_TB.user_id}</td>
            <td>${USER_TB.user_nm}</td>
            <td>${USER_TB.user_email}</td>
            <td>${USER_TB.subs_dt}</td>
            <td>${USER_TB.gender}</td>
            <td>${USER_TB.bryr}</td>
        </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>