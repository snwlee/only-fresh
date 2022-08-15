<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>My First Web Page</title>
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
            <p>이름 : <input class="create_input" name="nm"></p>
            <p>설명 :<input class="create_input" name="des"></p>
            <p>사진(설명x) :<input class="create_input" name="photo"></p>
            <p>사진 대체 설명<input class="create_input" name="photo_alt"></p>
            <p>제조업체<input class="create_input" name="mft"></p>
            <p>결제방식<input class="create_input" name="setl_methd_cd"></p>
            <p>시작일<input class="create_input" name="stpt_dd"></p>
            <p>종료일<input class="create_input" name="expi_dd"></p>
            <p>조기종료상태<input class="create_input" name="early_end_stus"></p>
            <p>할인율<input class="create_input" name="ds_rate"></p>
            <button id="create_button" class="">CREATE</button>
        </div>
        <div class="content">
            <h2>수정할 이벤트를 선택해 주세요</h2>
            <p>
                <select id="events_to_update" class="events">
                </select>
            </p>
            <div id="update_inputs" style="visibility : hidden">
                <p>이름 : <input class="update_input" name="nm"></p>
                <p>설명 :<input class="update_input" name="des"></p>
                <p>사진(설명x) :<input class="update_input" name="photo"></p>
                <p>사진 대체 설명<input class="update_input" name="photo_alt"></p>
                <p>제조업체<input class="update_input" name="mft"></p>
                <p>결제방식<input class="update_input" name="setl_methd_cd"></p>
                <p>시작일<input class="update_input" name="stpt_dd"></p>
                <p>종료일<input class="update_input" name="expi_dd"></p>
                <p>조기종료상태<input class="update_input" name="early_end_stus"></p>
                <p>할인율<input class="update_input" name="ds_rate"></p>
                <button id="update_button">UPDATE</button>
            </div>
        </div>
        <div class="content">
            <label>삭제할 이벤트를 선택해 주세요</label>
            <p>
                <select id="events_to_delete" class="events">
                </select>
            </p>
            <button id="delete_button">DELETE</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    // UTILS
    let toLiTags = function (result) {
        let tmp = "<ul>";

        result.forEach(el => {
            tmp += "<li><img width='200' height='100' src='" + el.photo + "'/></li>"
        })
        tmp += "</ul>";

        return tmp;
    }
    let toOptionTags = function (result) {
        let tmp = "";
        result.forEach(el => {
            tmp += "<option class='event'>" + el.event_id + "</option>";
        })
        return tmp;
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
    let addZero = function (value = 1) {
        return value > 9 ? value : "0" + value;
        ;
    }
    let dateToString = function (ms = 0) {
        let date = new Date(ms);

        let yyyy = date.getFullYear();
        let mm = addZero(date.getMonth() + 1);
        let dd = addZero(date.getDate());

        return "" + yyyy + mm + dd;
    }

    function bringEventOptions() {
        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/dev_kurly/event/id_list',  // 요청 URI
            success: function (result) {
                $(".events").html(toOptionTags(result));
            },
            error: function () {
                alert("error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    // DOM
    $(document).ready(function () {
        bringEventOptions();

        $("#delete_button").click(() => {
            let event_id = $("#events_to_delete option:selected").val();
            $.ajax({
                type: 'DELETE',       // 요청 메서드
                url: '/dev_kurly/event/' + event_id,  // 요청 URI
                success: function () {
                    bringEventOptions();
                    alert("delete success");
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            })
        })

        $("#select_button").click(function () {
            $.ajax({
                type: 'GET',       // 요청 메서드
                url: '/dev_kurly/event/list',  // 요청 URI
                success: function (result) {
                    result.forEach((el) => {
                        $("#select_result").html(toLiTags(result));
                    })
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#create_button").click(function () {
            let obj = {};
            let create_inputs = document.getElementsByClassName("create_input");
            for (let i = 0; i < create_inputs.length; i++) {
                let key = create_inputs[i].name;
                obj[key] = create_inputs[i].value;
            }

            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/dev_kurly/event/add',  // 요청 URI
                dataType: 'text',
                data: JSON.stringify(obj),
                contentType: "application/json",
                success: function () {
                    alert("success");
                    bringEventOptions();
                },
                error: function () {
                    alert("error")
                }, // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

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
                url: '/dev_kurly/event/' + event_id,
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
                type: 'GET',       // 요청 메서드
                url: '/dev_kurly/event/' + this.value,  // 요청 URI
                success: function (result) {
                    modifyValues(result);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        })

        // new_to_top button 을 유저가 click 했을 때
        $("#new_to_top").click(function(){
            $.ajax({
                url: "/dev_kurly/product_list/new"
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