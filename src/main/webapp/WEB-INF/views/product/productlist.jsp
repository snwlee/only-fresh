<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>DevKurly</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
    #img{
        width:300px;
        height: 150px;
    }


</style>
<div id="container" style="width:100%; background-color:lightgrey; color:green; text-align:center">
    <ul>
        <li><a class="btn" href="<c:url value="/"/>">DevKurly</a></li>
        <li>
            <button type="button" id="writeBtn" class="btn" onclick="location.href='<c:url value="/product/write"/>'">
                상품등록
            </button>
        </li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=sel_price'/>">높은 가격순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_asc=sel_price'/>">낮은 가격순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=ds_rate'/>">혜택순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=sales_rate'/>">판매량순</a></li>
        <li><a class="btn" href="<c:url value='/product/list?order_sc=in_date'/>">신상품순</a></li>
    </ul>
    <form action="<c:url value="/product/list"/>" class="search-form" method="get">
        <select class="search-option" name="option">
            <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>검색</option>
            <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>상품명</option>
            <option value="C" ${ph.sc.option=='C' ? "selected" : ""}>제조사명</option>
        </select>
        <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
        <input type="submit" class="search-button" value="검색">
    </form>
    <table border="1">
        <div>상품리스트</div>
        <c:forEach var="ProductDto" items="${list}">
            <form action="/carts/${ProductDto.pdt_id}" id="form" method="post">
                <div id="product">
                    <tr>
                        <td><button class="cart_btn" type="submit">장바구니에 추가</button></td>
                        <td><input type="number" value=1 name="count"></td>
                        <td> 태그이름: ${ProductDto.tag_name}</td>
                        <td> 제품명 :<a href="<c:url value="/product/read?pdt_id=${ProductDto.pdt_id}"/>"><c:out value="${ProductDto.title}"/></a></td>
                        <td> 소제목: ${ProductDto.sub_title}</td>
                        <td> 할인율 : ${ProductDto.ds_rate}%</td>
                        <td> 원가 : ${ProductDto.price}원</td>
                        <td><img id="img" src="${ProductDto.image}"/></td>
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
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script>

        let msg = "${param.msg}"
        if(msg=="LIST_ERR")  alert("상품 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
        if(msg=="READ_ERR")  alert("삭제되었거나 없는 상품입니다.");
        if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
        if (msg == "WRT_ERR") alert("상품이 등록되지 않았습니다.");
        if (msg == "MOD_ERR") alert("상품 수정에 실패했습니다.");
        if (msg == "MOD_OK") alert("상품 수정에 성공했습니다.");
        if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
        if(msg=="DEL_ERR")   alert("삭제되었거나 없는 상품입니다.");


        $(document).ready(function () {
            $('#ascBtn').on("click", function () {
                window.location.href = "<c:url value='/product/list?order_sc=sel_price'/>";
                window.location.href = "<c:url value='/product/list?order_asc=sel_price'/>";
                window.location.href = "<c:url value='/product/list?order_sc=ds_rate'/>";
                window.location.href = "<c:url value='/product/list?order_sc=sales_rate'/>";
                window.location.href = "<c:url value='/product/list?order_sc=in_date'/>";
            });

        });
    </script>
    <div style="text-align:center">
        <div class="board-container">
            <div class="search-container">

            </div>
            <br>
            <div class="paging-container">
                <div class="paging">
<%--                    <c:if test="${totalCnt==null || totalCnt==0}">--%>
<%--                        <div> 게시물이 없습니다. </div>--%>
<%--                    </c:if>--%>
                    <c:if test="${totalCnt!=null && totalCnt!=0}">
                        <c:if test="${ph.showPrev}">
                            <a class="page" href="<c:url value="/product/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/product/list${ph.sc.getQueryString(i)}"/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="page" href="<c:url value="/product/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>