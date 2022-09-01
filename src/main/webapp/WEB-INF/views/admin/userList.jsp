<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OnlyFresh :: </title>
    <link rel="icon" href="/only-fresh-favicon.svg" />
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<style>
    #logo{
        color: rebeccapurple;
    }
    li{
        display: block;
        list-style: none;
    }
    a{
        text-decoration: none;
        color: rebeccapurple;
    }
    #writeBtn{
        width: 100px;
        height: 30px;
        color: rebeccapurple;
    }
</style>
<div id="menu">
    <ul>
        <li id="logo">Devkurly</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/admin/list'/>">Board</a></li>
        <li><a type="button" id="writeBtn" onclick="location.href='<c:url value="/admin/write"/>'">회원등록</a></li>
    </ul>
</div>
<script>
    let msg = "${msg}"
    if(msg=="WRT_OK") alert("등록 완료");
    if(msg=="DEL_OK") alert("삭제 완료");
    if(msg=="DEL_ERR") alert("삭제 실패");
</script>
<div style="text-align:center">
    <table border="1">
        <tr>
            <th>id</th>
            <th>이름</th>
            <th>이메일</th>
            <th>가입일</th>
            <th>성별</th>
            <th>생년월일</th>
        </tr>
        <form id="form" class="frm" action="" method="post">
        <c:forEach var="USER_TB" items="${list}">
           <tr>
               <td><a href="<c:url value='/admin/read?user_id=${USER_TB.user_id}&page=${page}&pageSize=${pageSize}'/>">${USER_TB.user_id}</a></td>
               <td><input type="text" name="user_nm" value="${USER_TB.user_nm}"readonly="readonly"></td>
               <td><input type="text" name="user_email" value="${USER_TB.user_email}"readonly="readonly"></td>
               <td><input type="text" name="subs_dt" value="${USER_TB.subs_dt}"readonly="readonly"></td>
               <td><input type="text" name="gender" value="${USER_TB.gender}"readonly="readonly"></td>
               <td><input type="text" name="bryr" value="${USER_TB.bryr}"readonly="readonly"></td>
           </tr>
           </div>
        </c:forEach>
        </form>
    </table>
    <br>
    <div>
        <c:if test="${ph.showPrev}">
            <a href="<c:url value='/admin/list?page=$${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a href="<c:url value='/admin/list?page=$${i}&pageSize=${ph.pageSize}'/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
            <a href="<c:url value='/admin/list?page=$${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
        </c:if>
    </div>
</div>
<script>
    $(document).ready(function(){
        $(".btn-remove").on("click", function(){
            console.log("clicked")
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