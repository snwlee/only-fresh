<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>배송지 추가</title>
</head>
<body>
<script>
    let msg="${msg}";
    if(msg=="INS_ERR") alert("배송지 등록에 실패했습니다. 다시 시도해 주세요.");
</script>
    <h2>배송지 추가</h2>
    <br>
    <form action="" id="form">
<%--        <div>${mode=="deli" ? "샛별배송" : "낮 배송"}지역 입니다.</div>--%>
<%--        <div>${mode=="deli" ? "매일 아침, 문앞까지 신선함을 전해드려요" : "오늘 주문하면 다음 날 바로 도착해요. (일요일 휴무)"}</div>--%>
        <div>
            주소 : <input type="text" name="main_addr" value=""/>
            <button type="button" id="searchBtn" class="btn">재검색</button>
        </div>
        <div>상세주소 : <input type="text" name="sub_addr" value=""/></div>
        <div><input type="checkbox" name="chk_addr" value=""/>기본배송지로 저장</div>
        <div><button type="button" id="insertBtn" class="btn">저장</button> </div>
    </form>
    <script>
        $(document).ready(function() {  // main()와 같다. jquery
            $('#insertBtn').on("click", function (){
                let form = $('#form');
                form.attr("action", "<c:url value='/address/create'/>");
                form.attr("method", "post");
                form.submit();
            });
        });
    </script>
</body>
</html>
