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
        justify-content: center;
        align-items: center;
        margin-top: 300px;

    }

    li {
        display: inline-block;
    }

    a {
        color: #ffffff;
        text-decoration: none;
    }

    a:visited {
        text-decoration: none;
        color: #ffffff;
    }
    .btn {
        cursor: pointer;
        width: 200px;
        height: 50px;
        border-radius: 5px;
        border: none;
        background-color: #5F0080;
        color: #ffffff;
        font-size: 16px;
        font-weight: 400;
        margin-top: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .cart_btn {
        cursor: pointer;
        width: 100px;
        height: 50px;
        border-radius: 5px;
        border: none;
        background-color: #5F0080;
        color: #ffffff;
        font-size: 16px;
        font-weight: 100;
        margin-bottom: 50px;
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
        <li><a class="btn" href="<c:url value='/product/list?order_sc=ds_rate'/>">혜택순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=sales_rate'/>">판매량순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=in_date'/>">신상품순</a></li>


    </ul>
    <h2>상품 리스트</h2>
    <form action="" id="form">

        <table border="1">
            <c:forEach var="ProductDto" items="${list}">
                  <a class="cart_btn" href="<c:url value="/carts/add/${ProductDto.pdt_id}"/>">장바구니에 추가</a>
                <p>제품명 :<a href="<c:url value="/product/read?pdt_id=${ProductDto.pdt_id}"/>"> <c:out value="${ProductDto.title}"/></a>
                       할인율 :   ${ProductDto.ds_rate}%
                       판매가 :     ${ProductDto.sel_price}원
                       원가 :     ${ProductDto.price}원
                       소제목 :     ${ProductDto.sub_title}
                       배송타입 :     ${ProductDto.de_type}</p>
<%--                       판매율 :     ${ProductDto.sales_rate}--%>
<%--                       재고 : ${ProductDto.stock}</p>--%>
            </c:forEach>

</div>
</table>
</form>
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
           window.location.href = "<c:url value='/product/list?order_sc=ds_rate'/>";
           window.location.href = "<c:url value='/product/list?order_sc=sales_rate'/>";
           window.location.href = "<c:url value='/product/list?order_sc=in_date'/>";
       });

    });
</script>
</body>
</html>