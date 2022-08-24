<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true"%>

<html>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <meta charset="UTF-8">
    <title>DevKurly</title>
</head>
<body>
        <div id="address" style="text-align: center">
            <table border="1">
            <tr id="title">
                <th>배송지 관리</th>
                <th>배송지</th>
                <th><button type="button" id="insertBtn" class="btn" onclick="location.href='<c:url value="/address/insert"/>'" >새 배송지 추가</button></th>
<%--                <th><a href="<c:url value='/address/insert'/>">새 배송지 추가</a></th>--%>
<%--                <th><input type="button" value="새 배송지 추가" onclick="kakaopost()"></th>--%>
            </tr><br>
            <tr>
                <th>배송지번호</th>
                <th>유저번호</th>
                <th>선택</th>
                <th>메인주소</th>
                <th>상세주소</th>
                <th>받으실 분</th>
                <th>연락처</th>
                <th>배송유형</th>
                <th>수정</th>
            </tr>
                <form action="" id="form" >
                    <c:forEach var="addressDto" items="${list}">
                        <tr>
                            <th>${addressDto.addr_id}</th>
                            <th>${addressDto.user_id}</th>
                            <th>${addressDto.chk_addr}</th>
                            <th>${addressDto.main_addr}</th>
                            <th>${addressDto.sub_addr}</th>
                            <th>${addressDto.addr_name}</th>
                            <th>${addressDto.addr_tel}</th>
                            <th>${addressDto.deli_type}</th>
<%--                            <th>${addressDto.city_code}</th>--%>
<%--                            <th><button type="button" id="modifyBtn" class="btn">수정</button></th>--%>
                            <th><a href="<c:url value='/address/read?addr_id=${addressDto.addr_id}'/>">수정</a></th>
                        </tr>
                    </c:forEach>
                </form>
            </table>
        </div>
        <script>

            let msg = "${param.msg}"
            if(msg=="WRT_OK") alert("성공적으로 등록되었습니다.");
            if(msg=="DEL_OK") alert("성공적으로 삭제되었습니다.");
            if(msg=="DEL_ERR") alert("삭제에 실패했습니다.");
            if(msg=="INS_OK") alert("성공적으로 등록되었습니다.");
            if(msg=="INS_ERR") alert("등록에 실패했습니다.");

            <%--$('#modifyBtn').on("click", function (){--%>
            <%--    let form = $('#form');--%>
            <%--    form.attr("action", "<c:url value='/address/read'/>");--%>
            <%--    form.attr("method", "get");--%>
            <%--    form.submit();--%>
            <%--});--%>

         <%-- 배송지 추가 화면 --%>
         <%--   $('#insertBtn').on("click", function (){--%>
         <%--       let form = $('#form');--%>
         <%--       form.attr("action", "<c:url value='/address/insert'/>");--%>
         <%--       form.attr("method", "get");--%>
         <%--       form.submit();--%>
         <%--   });--%>



        </script>

        <%-- 카카오 API --%>
<%--        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>--%>
<%--        <script>--%>
<%--            function kakaopost(){--%>
<%--                new daum.Postcode({--%>
<%--                    oncomplete: function(data) {--%>
<%--                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.--%>
<%--                        // 예제를 참고하여 다양한 활용법을 확인해 보세요.--%>
<%--                        document.getElementById("main_addr").value = data.address; // 주소 넣기--%>
<%--                        document.querySelector("input[name=sub_addr]").focus(); //상세입력 포커싱--%>
<%--                    }--%>
<%--                }).open();--%>
<%--            }--%>
<%--        </script>--%>
</body>
</html>
