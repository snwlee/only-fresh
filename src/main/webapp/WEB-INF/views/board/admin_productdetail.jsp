\<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reference by chaehoon</title>
    <%--    <link rel="stylesheet" href="/dev_kurly/reset.css" type="text/css">--%>
    <style>
        #whole_container {
            width: 100%;
            height: 100vh;
        }

        #navigation {
            width: 100%;
            height: 156px;
            background-color: #8b00ff;
        }

        #content_body {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .content {
            width: 400px;
            border: 1px solid #8b00ff;
        }

        button {
            width: 200px;
            height: 100px;
        }

        input {
            width: 80%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>

<body>
<div id="whole_container">
    <div id="navigation">

    </div>
    <div id="content_body">
        <div class="content">
            <div id="detail_explain">
                <h1>디테일 예시</h1>
                de_type : f:낮배송, t: 샛별배송<br>
                company : 미니올리바<br>
                pack_cd : 상온(종이포장), 냉장(종이포장)<br>
                sell_cd : 1팩(12개입), 1팩<br>
                weca_cd : 96ml, 900ml<br>
                origin : 원산지<br>
                allg_dt : 우유 함유, 대두 함유<br>
                ex_dt : 수령일 포함 최소 6일 이상 남은 상품을 발송드립니다.<br>
                notice : 패키지가 변경됩니다. 환경을 생각한 친환경잉크를 사용한 패키지로 변경<br>
                prt_info : 이제는 유기농 콩으로 만든 두부면으로 그 힘겨움을 조금 덜어보세요.<br>

            </div>
        </div>
        <div class="content">
            <h2>등록할 상품-디테일을 선택해주세요.</h2>
            <p>
                <select id="events_to_update" class="events">
                </select>
            </p>
            <div id="update_inputs" style="visibility : hidden">
                <p>배송유형(de_type)<input class="update_input" style="background-color: #e3e3e3" readonly name="de_type"></p>
                <p>제조사(company)<input class="update_input" style="background-color: #e3e3e3" readonly name="company"></p>
                <p>상품제목<input class="update_input" name="title" style="background-color: #e3e3e3" readonly></p>
                <p>상품 소제목<input class="update_input" name="sub_title" style="background-color: #e3e3e3" readonly></p>
                <p>할인율<input class="update_input" name="ds_rate" style="background-color: #e3e3e3" readonly></p>
                <p>판매가격<input class="update_input" name="sel_price" style="background-color: #e3e3e3" readonly></p>
                <p>가격<input class="update_input" name="price" style="background-color: #e3e3e3" readonly></p>
                <p>포장타입(pack_cd)<input class="update_input" name="pack_cd"></p>
                <p>판매단위(sell_cd)<input class="update_input" name="sell_cd"></p>
                <p>중량/용량(weca_cd)<input class="update_input" name="weca_cd"></p>
                <p>원산지(origin)<input class="update_input" name="origin"></p>
                <p>알레르기 정보(allg_dt)<input class="update_input" name="allg_dt"></p>
                <p>유통기한(ex_dt)<input class="update_input" name="ex_dt"></p>
                <p>안내사항(notice)<input class="update_input" name="notice"></p>
                <p>고화질이미지(prt_image)<input class="update_input" name="prt_image"></p>
                <p>상품설명(prt_info)<input class="update_input" name="prt_info"></p>
                <button id="update_button">상품 디테일 추가하기</button>
                <button id="test_button">상품 디테일 수정하기</button>
            </div>
        </div>
        <div class="content">
        </div>
    </div>
</div>
<script src="/product_detail/js/admin_productdetail.js"></script>
</script>
</body>
</html>