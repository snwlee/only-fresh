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
        color: white;
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

    #container {
        width: 100%;
        background: #dddddd;
        color: green;
        padding: 30px;
    }

    #product {
    }


</style>
<div id="container" style="width:100%; background-color:lightgrey; color:green; text-align:center">
    <ul>
        <li><a class="btn" href="<c:url value='/'/>">DevKurly</a></li>
        <li><a href=""><i class="fas fa-search small"></i></a></li>
        <li>
            <button type="button" id="writeBtn" class="btn" onclick="location.href='<c:url value="/product/write"/>'">
                상품등록
            </button>
        </li>
        <li><a class="btn" href="<c:url value='/product/list?page=1&pageSize=10&order_sc=sel_price'/>">높은 가격순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?page=1&pageSize=10&order_asc=sel_price'/>">낮은 가격순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?page=1&pageSize=10&order_sc=ds_rate'/>">혜택순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?page=1&pageSize=10&order_sc=sales_rate'/>">판매량순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?page=1&pageSize=10&order_sc=in_date'/>">신상품순</a></li>


    </ul>

    <table border="1">
                    <div>상품리스트</div>
        <c:forEach var="ProductDto" items="${list}">
            <form action="carts/add/${ProductDto.pdt_id}" id="form">
                <div id="product">
                    <tr>
                    <td><input type="number" value=1 name="count"></td>
                    <td><a class="cart_btn" href="<c:url value="/carts/add/${ProductDto.pdt_id}"/>">장바구니에 추가</a></td>
                    <td> 태그이름: ${ProductDto.tag_name}</td>
                    <td> 제품명 :<a href="<c:url value="/product/read?pdt_id=${ProductDto.pdt_id}"/>"><c:out value="${ProductDto.title}"/></a></td>
                    <td> 소제목: ${ProductDto.sub_title}</td>
                    <td> 할인율 : ${ProductDto.ds_rate}%</td>
                    <td> 원가 : ${ProductDto.price}원</td>
                    <td> 판매가 : ${ProductDto.sel_price}원</td>
                    <td> 판매량 : ${ProductDto.sales_rate} 개</td>
                    <td> 배송타입 : ${ProductDto.de_type}</td>
                    <td> 제조사 : ${ProductDto.company}</td>
                    <td> 카테고리 이름 : ${ProductDto.cd_name} </td>
                    </tr>
                </div>
                <br>

            </form>
        </c:forEach>

    </table>
    <br>
    <div>
        <c:if test="${ph.showPrev}">
        <a href="<c:url value='/product/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a href="<c:url value='/product/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
        <a class="page" href="<c:url value='/product/list/?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
        </c:if>


        <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
        <script>
            let msg = "${param.msg}"
            if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
            if (msg == "WRT_ERR") alert("상품이 등록되지 않았습니다.");
            if (msg == "MOD_ERR") alert("상품 수정에 실패했습니다.");
            if (msg == "MOD_OK") alert("상품 수정에 성공했습니다.");
            if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
            if (msg == "DEL_ERR") alert("삭제에 실패했습니다.")


            $(document).ready(function () {
                $('#ascBtn').on("click", function () {
                    window.location.href = "<c:url value='/product/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}&order_sc=sel_price'/>";
                    window.location.href = "<c:url value='/product/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}&order_asc=sel_price'/>";
                    window.location.href = "<c:url value='/product/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}&order_sc=ds_rate'/>";
                    window.location.href = "<c:url value='/product/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}&order_sc=sales_rate'/>";
                    window.location.href = "<c:url value='/product/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}&order_sc=in_date'/>";
                });

            });
        </script>
</body>
</html>