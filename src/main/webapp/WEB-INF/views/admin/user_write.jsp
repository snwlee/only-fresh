<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원등록 페이지</title>
    <%@ include file="/WEB-INF/views/admin/user_header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/user_border.jsp" %>
<h2>회원등록폼</h2>
<form name="form1" method="post" action="${path}/user/insert">
    <table border="1" width="400px">
        <tr>
            <td>아이디</td>
            <td><input name="userId"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="userPw"></td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input name="userName"></td>
        </tr>
        <tr>
            <td>이메일주소</td>
            <td><input name="userEmail"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="확인">
                <input type="reset" value="취소">
            </td>
        </tr>
    </table>
</form>
</body>
</html>