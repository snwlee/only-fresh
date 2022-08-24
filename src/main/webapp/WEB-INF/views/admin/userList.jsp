<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Devkurly</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
        font-family: "Noto Sans KR", sans-serif;
    }
    a {
        text-decoration: none;
        color: rebeccapurple;
    }
    button,
    input {
        border: none;
        outline: none;
    }
    .board-container {
        width: 60%;
        height: 1200px;
        margin: 0 auto;
        /* border: 1px solid black; */
    }
    .search-container {
        background-color: rgb(255, 255, 255);
        width: 100%;
        height: 110px;
        border: 1px solid #ffffff;
        margin-top : 10px;
        margin-bottom: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .search-form {
        height: 37px;
        display: flex;
    }
    .search-option {
        width: 100px;
        height: 100%;
        outline: none;
        margin-right: 5px;
        border: 1px solid #d3c2ff;
        color: #9370db;
    }
    .search-option > option {
        text-align: center;
    }
    .search-input {
        color: #9370db;
        background-color: white;
        border: 1px solid #d3c2ff;
        height: 100%;
        width: 300px;
        font-size: 15px;
        padding: 5px 7px;
    }
    .search-input::placeholder {
        color: mediumpurple;
    }
    .search-button {
        /* 메뉴바의 검색 버튼 아이콘  */
        width: 20%;
        height: 100%;
        background-color: rgb(139, 0, 255);
        color: rgb(255, 255, 255);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 15px;
    }
    .search-button:hover {
        color: rgb(147, 112, 219);
    }
    table {
        border-collapse: collapse;
        width: 100%;
        border-top: 2px solid rgb(0, 0, 0);
    }
    th,
    td {
        width:300px;
        text-align: center;
        padding: 10px 12px;
        border-bottom: 1px solid #ddd;
    }
    td {
        color: rgb(53, 53, 53);
    }
    .no      { width:150px;}
    .title   { width:50%;  }
    td.title   { text-align: left;  }
    td.writer  { text-align: left;  }
    td.viewcnt { text-align: right; }
    td.title:hover {
        text-decoration: underline;
    }
    .paging {
        color: rebeccapurple;
        width: 100%;
        align-items: center;
    }
    .page {
        color: rebeccapurple;
        padding: 6px;
        margin-right: 10px;
    }
    .paging-active {
        background-color: rgb(216, 216, 216);
        border-radius: 5px;
        color: rgb(102, 51, 153);
    }
    .paging-container {
        width:100%;
        height: 70px;
        display: flex;
        margin-top: 50px;
        margin : auto;
    }
    .btn-write {
        background-color: rgb(236, 236, 236); /* Blue background */
        border: none; /* Remove borders */
        color: rebeccapurple; /* White text */
        padding: 6px 12px; /* Some padding */
        font-size: 16px; /* Set a font size */
        cursor: pointer; /* Mouse pointer on hover */
        border-radius: 5px;
        margin-left: 30px;
    }
    .btn-write:hover {
        text-decoration: underline;
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
    <div class="board-container">
        <div class="search-container">
            <form action="<c:url value="/admin/list"/>" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>이름+이메일</option>
                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>이름만</option>
                    <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>회원id</option>
                </select>

                <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                <input type="submit" class="search-button" value="검색">
            </form>
        </div>

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
    <div class="paging-container">
        <div class="paging">
            <c:if test="${totalCnt==null || totalCnt==0}">
                <div> 게시물이 없습니다. </div>
            </c:if>
            <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value="/admin/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="page" href="<c:url value="/admin/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                </c:if>
            </c:if>
        </div>
    </div>
</div>
</div>
</body>
</html>