<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script>
        let msg ="${msg}"
        if(msg=="WRT_ERR") alert("게시글 등록에 실패했습니다. 다시 등록해주세요.");
    </script>
</head>
<body>
    <h2>상품 정보 ${mode=="new" ? "상품 등록" : "상품 확인"}</h2>
<form action="" id="form" >
    <input type="hidden" name="pdt_id" value="${ProductDto.pdt_id}"}>
    <input type="text" name="title" value="${ProductDto.title}" placeholder="제품이름 입력" ${ mode=="new" ? '' : 'readonly="readonly"'}>
    <input type="text" name="ds_rate" value="${ProductDto.ds_rate}" placeholder="제품할인율 입력"${ mode=="new" ? '' : 'readonly="readonly"'}>
    <input type="text" name="sel_price" value="${ProductDto.sel_price}" placeholder="제품판매가 입력"${ mode=="new" ? '' : 'readonly="readonly"'}>
    <input type="text" name="price" value="${ProductDto.price}"placeholder="제품실제가 입력"${ mode=="new" ? '' : 'readonly="readonly"'}>
    <input type="text" name="sub_title" value="${ProductDto.sub_title}" placeholder="제품 소제목 입력"${ mode=="new" ? '' : 'readonly="readonly"'}>
    <input type="text" name="company" value="${ProductDto.company}" placeholder="제품 제조사 입력"${ mode=="new" ? '' : 'readonly="readonly"'}>
    <input type="text" name="de_type" value="${ProductDto.de_type}" placeholder="제품 배송타입 입력"${ mode=="new" ? '' : 'readonly="readonly"'}>

    <button type="button" id="writeBtn" class="btn">등록</button>
    <button type="button" id="modifyBtn" class="btn">수정</button>
    <button type="button" id="removeBtn" class="btn">삭제</button>
    <button type="button" id="listBtn" class="btn">목록</button>
</form>
<script>
    $(document).ready(function() {
        $("#listBtn").on("click", function () {
            location.href = "<c:url value='/product/list?page=1&pageSize=10'/>";
        });


        $("#writeBtn").on("click", function(){
            let form = $("#form");
            form.attr("action", "<c:url value='/product/write'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("#removeBtn").on("click", function () {
            if (!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/product/remove'/>");
            form.attr("method", "post");
            form.submit();
        });


        $("#modifyBtn").on("click", function () {
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');
            // 1. 읽기 상태이면, 수정 상태로 변경
            if (isReadonly == 'readonly') {
                $("input[name=title]").attr('readonly', false);
                $("input[name=ds_rate]").attr('readonly', false);
                $("input[name=sel_price]").attr('readonly', false);
                $("input[name=price]").attr('readonly', false);
                $("input[name=sub_title]").attr('readonly', false);
                $("input[name=company]").attr('readonly', false);
                $("input[name=de_type]").attr('readonly', false);
                $("#modifyBtn").html("수정");
                $("h2").html("상품 상세정보 상품 수정");
                return;
            }

            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/product/modify'/>");
            form.attr("method", "post");
                form.submit();
        });



    });



</script>
</body>
</html>