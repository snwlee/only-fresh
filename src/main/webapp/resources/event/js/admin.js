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
        url: '/event/id_list',  // 요청 URI
        success: function (result) {
            $(".events").html(toOptionTags(result));
        },
        error: function () {
            alert("get event list error")
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
            url: '/event/' + event_id,  // 요청 URI
            success: function () {
                bringEventOptions();
                alert("delete success");
            },
            error: function () {
                alert("delete button error")
            } // 에러가 발생했을 때, 호출될 함수
        })
    })

    $("#select_button").click(function () {
        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/event/list',  // 요청 URI
            success: function (result) {
                result.forEach((el) => {
                    $("#select_result").html(toLiTags(result));
                })
            },
            error: function () {
                alert("select button error")
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
            url: '/event/add',  // 요청 URI
            dataType: 'text',
            data: JSON.stringify(obj),
            contentType: "application/json",
            success: function () {
                alert("success");
                bringEventOptions();
            },
            error: function (res) {
                if(res.code === 404)
                    // alert(this.error.message());
                    alert("create button error")
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
            url: '/event/' + event_id,
            dataType: 'text',
            data: JSON.stringify(obj),
            contentType: "application/json",
            success: function () {
                alert("update success");
            },
            error: function () {
                alert("update button error")
            },
        });
    })

    $("#events_to_update").change(function () {
        $("#update_inputs").css('visibility', 'visible');

        $.ajax({
            type: 'GET',       // 요청 메서드
            url: '/event/' + this.value,  // 요청 URI
            success: function (result) {
                modifyValues(result);
            },
            error: function () {
                alert("events to update error")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
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