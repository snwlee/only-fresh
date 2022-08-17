<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>회원정보 상세 페이지</title>
  <%@ include file="/WEB-INF/views/admin/user_header.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/user_border.jsp"%>
  <h2>회원정보 상세</h2>
  <form name="form1" method="post">
      <table border="1" width="400px">
          <tr>
              <td>id</td>
              <td><input name="user_id" value="${UserDto.user_id}" readonly="readonly"></td>
          </tr>
          <tr>
              <td>비밀번호</td>
              <td><input type="password" name="pwd"</td>
          </tr>
          <tr>
              <td>이름</td>
              <td><input name="userName" value="${UserDto.user_nm}"></td>
          </tr>
          <tr>
              <td>회원가입일자</td>
              <td>
                  <fmt:formatDate value="${UserDto.subs_dt}" pattern="yyyy-MM-dd HH:mm:ss"/>
              </td>
          </tr>
          <tr>
              <td>회원정보 수정일자</td>
              <td>
                  <fmt:formatDate value="${UserDto.up_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
              </td>
          </tr>
          <tr>
              <td colspan="2" align="center">
                  <input type="button" value="수정" id="btnUpdate">
                  <input type="button" value="삭제" id="btnDelete">
              </td>
          </tr>
      </table>
  </form>
</body>
</html>