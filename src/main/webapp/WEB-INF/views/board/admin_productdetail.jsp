<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <button id="select_button">selectAll</button>
            <div id="select_result"></div>
        </div>
        <div class="content create_event">
            <p>배송타입<input class="create_input" name="de_type"></p>
            <p>제조사<input class="create_input" name="company"></p>
            <p>상품제목<input class="create_input" name="title"></p>
            <p>상품 소제목<input class="create_input" name="sub_title"></p>
            <p>할인율<input class="create_input" name="ds_rate"></p>
            <p>판매가격가격<input class="create_input" name="sel_price"></p>
            <p>가격<input class="create_input" name="price"></p>
            <p>배송타입<input class="create_input" name="de_type"></p>
            <p>포장타입<input class="create_input" name="pack_cd"></p>
            <p>판매단위<input class="create_input" name="sell_cd"></p>
            <p>중량/용량<input class="create_input" name="weca_cd"></p>
            <p>원산지<input class="create_input" name="origin"></p>
            <p>알레르기 정보<input class="create_input" name="allg_dt"></p>
            <p>유통기한<input class="create_input" name="ex_dt"></p>
            <p>안내사항<input class="create_input" name="notice"></p>
            <button id="create_button" class="">CREATE</button>
        </div>
        <div class="content">
            <h2>수정할 상품-디테일을 선택해주세요.</h2>
            <p>
                <select id="events_to_update" class="events">
                </select>
            </p>
            <div id="update_inputs" style="visibility : hidden">
                <p>배송타입<input class="update_input" name="de_type"></p>
                <p>제조사<input class="update_input" name="company"></p>
                <p>상품제목<input class="update_input" name="title"></p>
                <p>상품 소제목<input class="update_input" name="sub_title"></p>
                <p>할인율<input class="update_input" name="ds_rate"></p>
                <p>판매가격가격<input class="update_input" name="sel_price"></p>
                <p>가격<input class="update_input" name="price"></p>
                <p>배송타입<input class="update_input" name="de_type"></p>
                <p>포장타입<input class="update_input" name="pack_cd"></p>
                <p>판매단위<input class="update_input" name="sell_cd"></p>
                <p>중량/용량<input class="update_input" name="weca_cd"></p>
                <p>원산지<input class="update_input" name="origin"></p>
                <p>알레르기 정보<input class="update_input" name="allg_dt"></p>
                <p>유통기한<input class="update_input" name="ex_dt"></p>
                <p>안내사항<input class="update_input" name="notice"></p>
                <button id="update_button">UPDATE</button>
            </div>
        </div>
        <div class="content">
        </div>
    </div>
</div>
<script type="text/javascript">
    let toOptionTags = function (result) {
        let tmp = "";
        result.forEach(el => {
            tmp += "<option class='event'>" + el.pdt_id + "</option>";
        })
        return tmp;
    }

    function bringPdtOptions() {
        $.ajax({
            type: 'GET',
            url: '/event/id_list',  //ProductDto하나 추출하는 메서드의 주소
            success: function (result) {
                $(".events").html(toOptionTags(result));
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }
    let modifyValues = function (result) {
        for (const key in result) {
            if (key === "event_id") continue;
            if (key === "stpt_dd" || key === "expi_dd") {
                result[key] = dateToString(result[key]);
            }
            $(".update_input[name='" + key + "']").val(result[key]);
        }
    }
    // DOM
    $(document).ready(function () {
        bringPdtOptions();

        $("#update_button").click(function () {
            let event_id = $("#events_to_update").find(":selected").val();
            let obj = {};
            obj.event_id = event_id;
            let update_inputs = document.getElementsByClassName("update_input");
            for (let i = 0; i < update_inputs.length; i++) {
                let key = update_inputs[i].name;
                obj[key] = update_inputs[i].value;
            }

            $.ajax({
                type: 'PATCH',
                url: '/event/' + event_id,
                dataType: 'text',
                data: JSON.stringify(obj),
                contentType: "application/json",
                success: function () {
                    alert("update success");
                },
                error: function () {
                    alert("error")
                },
            });
        })

        $("#events_to_update").change(function () {
            $("#update_inputs").css('visibility', 'visible');

            $.ajax({
                type: 'GET',
                url: '/event/' + this.value,
                success: function (result) {
                    modifyValues(result);
                },
                error: function () {
                    alert("error")
                }
            });
        })

        // new_to_top button 을 유저가 click 했을 때
        $("#new_to_top").click(function(){
            $.ajax({
                url: "/product_list/new"
            })
        })

        $("#selling_to_top").click(function(){
            $.ajax({
                url: "/dev_kurly/product_list/selling"
            })
        })
    });
</script>
</body>
</html>