<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

  <title>OnlyFresh :: 회원가입</title>
</head>
<body>
<form action="<c:url value="/register/add"/>" method="POST" onsubmit="return formCheck(this)">
  <div class="title">Register</div>
  <div id="msg" class="msg">
    <c:if test="${not empty param.msg}">
      <i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)}</i>
    </c:if>
  </div>
  <label for="">아이디</label>
  <input class="input-field" type="text" name="id" >
  <label for="">비밀번호</label>
  <input class="input-field" type="password" name="pwd" >
  <label for="">이름</label>
  <input class="input-field" type="text" name="name">
  <label for="">이메일</label>
  <input class="input-field" type="text" name="email" >
  <label for="">생일</label>
  <input class="input-field" type="text" name="birth" >
  <div class="gender-chk">
    <label><input type="checkbox" name="남" value="man"/>남자</label>
    <label><input type="checkbox" name="여" value="female"/>여자</label>
    <label><input type="checkbox" name="선택안함" value="non"/>선택안함</label>
  </div>
  <button>회원 가입</button>
</form>
<script>
  function formCheck(frm) {
    let msg ='';

    if(frm.id.value.length<3) {
      setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
      return false;
    }

    if(frm.pwd.value.length<3) {
      setMessage('pwd의 길이는 3이상이어야 합니다.', frm.pwd);
      return false;
    }

    return true;
  }

  function setMessage(msg, element){
    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;

    if(element) {
      element.select();
    }
  }
</script>
</body>
</html>