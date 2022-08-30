<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>OnlyFresh :: </title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: "Noto Sans KR", sans-serif;
    }

    .container {
      width : 50%;
      margin : auto;
    }

    .writing-header {
      position: relative;
      margin: 20px 0 0 0;
      padding-bottom: 10px;
      border-bottom: 1px solid #323232;
    }

    input {
      width: 100%;
      height: 35px;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      padding: 8px;
      background: #f8f8f8;
      outline-color: #e6e6e6;
    }

    textarea {
      width: 100%;
      background: #f8f8f8;
      margin: 5px 0px 10px 0px;
      border: 1px solid #e9e8e8;
      resize: none;
      padding: 8px;
      outline-color: #e6e6e6;
    }

    .frm {
      width:100%;
    }
    .btn {
      background-color: rgb(236, 236, 236); /* Blue background */
      border: none; /* Remove borders */
      color: black; /* White text */
      padding: 6px 12px; /* Some padding */
      font-size: 16px; /* Set a font size */
      cursor: pointer; /* Mouse pointer on hover */
      border-radius: 5px;
    }

    .btn:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo">Only 프레쉬</li>
    <li><a href="<c:url value='/'/>">Only 프레쉬</a></li>
    <li><a href="<c:url value='/admin/list'/>">Board</a></li>
    <li><a href=""><i class="fa fa-search"></i></a></li>
  </ul>
</div>
<script>
  let msg = "${msg}";
  if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
  if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
  <h2 class="writing-header">회원정보 ${mode=="new" ? "등록" : "조회"}</h2>
  <form id="form" class="frm" action="" method="post">
    <!--id는 어떤 상황에서든지 변경 불가해야하므로-->
    <input type="hidden" name="user_id" value="<c:out value='${userDto.user_id}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>이름</td>
    <input type="text" name="user_nm" value="<c:out value='${userDto.user_nm}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>이메일</td>
    <input type="text" name="user_email" value="<c:out value='${userDto.user_email}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>비밀번호</td>
    <input type="text" name="pwd" value="<c:out value='${userDto.pwd}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>전화번호</td>
    <input type="text" name="telno" value="<c:out value='${userDto.telno}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>가입일</td>
    <input type="text" name="subs_dt" value="<c:out value='${userDto.subs_dt}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>성별</td>
    <input type="text" name="gender" value="<c:out value='${userDto.gender}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>생년월일</td>
    <input type="text" name="bryr" value="<c:out value='${userDto.bryr}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>
    <td>추천인 이메일</td>
    <input type="text" name="rcmdr_email" value="<c:out value='${userDto.rcmdr_email}'/>" ${mode=="new" ? "" : "readonly='readonly'"}><br>


    <c:if test="${mode eq 'new'}">
      <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
    </c:if>
      <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
      <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>

  </form>
</div>
<script>
  $(document).ready(function(){
    $('#listBtn').on("click", function (){
      location.href = "<c:url value='/admin/list'/>?page=${page}&pageSize=${pageSize}";
    });

    $("#writeBtn").on("click", function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/admin/write'/>");
      form.attr("method", "POST");  <!--post mapping이 Controller에서 잘 작동하는지 확인-->
      form.submit();
    });

  $("#modifyBtn").on("click", function(){
    let form = $("#form");
    let isReadonly = $("input").attr('readonly');

    // 1. 읽기 상태이면, 수정 상태로 변경
    if(isReadonly=='readonly') {
      $("input").attr('readonly',false);
      $("#modifyBtn").html("등록");
      $("h2").html("회원정보 수정");
      return;
    }

    // 2. 수정 상태이면, 수정된 내용을 서버로 전송
    form.attr("action", "<c:url value='/admin/modify'/>");  //update
    form.attr("method", "post");
    form.submit();
  });


  $("#removeBtn").on("click", function(){
    if(!confirm("정말로 삭제하시겠습니까?")) return;
    let form = $("#form");
    form.attr("action", "<c:url value='/admin/remove'/>?page=${page}&pageSize=${pageSize}");
    form.attr("method", "post");
    form.submit();
  });

});
</script>
</body>
</html>