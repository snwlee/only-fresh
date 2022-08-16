<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevKurly</title>
</head>
<body>
<style>
    p {
        display: inline;
        margin-top: 20px;

    }

    li {
        display: inline-block;
    }

    a {
        color: cornflowerblue;
        text-decoration: none;
    }


    a:visited {
        text-decoration: none;
        color: white;
    }
    .btn {
        cursor: pointer;
        width: 200px;
        height: 50px;
        border-radius: 5px;
        border: none;
        background-color: #5F0080;
        color: white;
        font-size: 16px;
        font-weight: 400;
        margin-top: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
    }





</style>
<div id="container" style="width:100%; background-color:lightgrey; color:green; text-align:center">
    <ul>
        <li id="logo">DevKurly</li>
        <li><a class="btn" href="<c:url value='/'/>">Home</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
        <li><button type="button" id="writeBtn" class= "btn" onclick="location.href='<c:url value="/product/write"/>'">상품등록</button></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=sel_price'/>">높은 가격순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_Asc=sel_price'/>">낮은 가격순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=ds_rate'/>">혜택순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=sales_rate'/>">판매량순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=in_date'/>">신상품순</a></li>


    </ul>
    <h2>상품 리스트</h2>
        <table border="1">
            <c:forEach var="ProductDto" items="${list}">
                <form action="carts/add/${ProductDto.pdt_id}" id="form">
                <a class="cart_btn" href="<c:url value="/carts/add/${ProductDto.pdt_id}"/>">장바구니에 추가</a>
                <input type="number" value=1 name="count">
                <p>태그 이름: ${ProductDto.tag_name}
                제품명 :<a href="<c:url value="/product/read?pdt_id=${ProductDto.pdt_id}"/>"> <c:out value="${ProductDto.title}"/></a>
                       소제목 :     ${ProductDto.sub_title}
                       할인율 :     ${ProductDto.ds_rate}%
                       원가 :       ${ProductDto.price}원
                       판매가 :     ${ProductDto.sel_price}원
                       판매량 :     ${ProductDto.sales_rate} 개
                       배송타입 :    ${ProductDto.de_type}
                       제조사 :     ${ProductDto.company}
                       재고 :       ${ProductDto.stock}개
                       재고 : ${ProductDto.stock}</p>
                </p>
                <br>

            </form>
            </c:forEach>

</table>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
    let msg = "${param.msg}"
    if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
    if (msg == "WRT_ERR") alert("상품이 등록되지 않았습니다.");
    if (msg == "MOD_ERR") alert("상품 수정에 실패했습니다.");
    if (msg == "MOD_OK") alert("상품 수정에 성공했습니다.");
    if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
    if (msg == "DEL_ERR") alert("삭제에 실패했습니다.")


    $(document).ready(function (){
       $('#ascBtn').on("click",function (){
           window.location.href = "<c:url value='/product/list?order_sc=sel_price'/>";
           window.location.href = "<c:url value='/product/list?order_Asc=sel_price'/>";
           window.location.href = "<c:url value='/product/list?order_sc=ds_rate'/>";
           window.location.href = "<c:url value='/product/list?order_sc=sales_rate'/>";
           window.location.href = "<c:url value='/product/list?order_sc=in_date'/>";
       });

    });
</script>
</body>
</html>