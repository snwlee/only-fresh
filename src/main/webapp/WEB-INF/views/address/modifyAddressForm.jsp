<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2022-08-12 (012)
  Time: 오후 3:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>Modify</title>
</head>
<body>
    <input type="button" value="팝업창 호출" />
    <div>
        <h2>배송지 수정</h2>
        <form action="" id="form">
            <div><input type="text" name="addr_id" style="display: none" value="${addressDto.addr_id}"/></div> <%-- 임시 하드코딩 --%>
            <div><input type="text" name="user_id" style="display: none" value="${addressDto.user_id}"/></div> <%-- 임시 하드코딩 --%>
            <div><input type="text" name="main_addr" value="${addressDto.main_addr}" readonly="readonly"/></div>
            <div><input type="text" name="sub_addr" value="${addressDto.sub_addr}"/></div>
            <div>받으실분</div>
            <div>
                <input type="text" name="addr_name" placeholder="이름을 입력해주세요" value="${addressDto.addr_name}"/>
            </div>
            <div>휴대폰</div>
            <div>
                <input type="text" name="addr_tel" placeholder="번호를 입력해주세요" value="${addressDto.addr_tel}"
                       maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
            </div>
            <div><input type="checkbox" name="chk_addr" value="true" onclick="checkAlert()">기본배송지로 저장</div>
            <div><button type="button" id="listBtn" class="btn">목록</button></div>
            <div><button type="button" id="modifyBtn" class="btn">수정</button></div>
            <div><button type="button" id="removeBtn" class="btn">삭제</button></div>
    </form>
    </div>
    <script>
        $(document).ready(function() {  // main()와 같다. jquery
            $('#listBtn').on("click", function (){

                location.href="<c:url value='/address/list'/>";
            });

            $('#removeBtn').on("click", function (){
                // if(!confirm("정말로 삭제하시겠습니까?")) return;
                let form = $('#form');
                form.attr("action", "<c:url value='/address/remove'/>?addr_id=${addressDto.addr_id}");
                form.attr("method", "post");
                form.submit();
            });

            $('#modifyBtn').on("click", function (){
                let form = $('#form');
                form.attr("action", "<c:url value='/address/modify'/>?addr_id=${addressDto.addr_id}");
                form.attr("method", "post");
                form.submit();
            });

            $('input:checkbox[id="checkbox_id"]').val();

        });
    </script>
</body>
</html>