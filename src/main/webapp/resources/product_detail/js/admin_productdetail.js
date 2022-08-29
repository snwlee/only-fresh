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
        url: '/detail/list',
        success: function (result) {
            $(".events").html(toOptionTags(result));
        },
        error: function () {
            alert("error")
        }
    });
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
$(document).ready(function () {
    bringPdtOptions();

    $("#update_button").click(function () {
        let pdt_id = $("#events_to_update").find(":selected").val();
        let obj = {};
        obj.pdt_id = pdt_id;
        let update_inputs = document.getElementsByClassName("update_input");
        for (let i = 0; i < update_inputs.length; i++) {
            let key = update_inputs[i].name;
            obj[key] = update_inputs[i].value;
        }
        $.ajax({
            type: 'POST',
            url: '/detail/add',
            dataType: 'text',
            data: JSON.stringify(obj),
            contentType: "application/json",
            success: function () {
                alert("WRT_DETAIL_OK");
                bringPdtOptions()
            },
            error: function () {
                alert("이미 등록된 상품디테일입니다.")
            },
        });
    })

    $("#test_button").click(function () {
        let pdt_id = $("#events_to_update").find(":selected").val();
        let obj = {};
        obj.pdt_id = pdt_id;
        let update_inputs = document.getElementsByClassName("update_input");
        for (let i = 0; i < update_inputs.length; i++) {
            let key = update_inputs[i].name;
            obj[key] = update_inputs[i].value;
        }
        console.log(obj);
        $.ajax({
            type: 'PATCH',
            url: '/detail/update',
            dataType: 'text',
            data: JSON.stringify(obj),
            contentType: "application/json",
            success: function () {
                alert("MOD_DETAIL_OK");
                bringPdtOptions()
            },
            error: function () {
                alert("Error")
            },
        });
    })
    $("#events_to_update").change(function () {
        $("#update_inputs").css('visibility', 'visible');

        $.ajax({
            type: 'GET',
            url: '/detail/' + this.value,
            success: function (result) {
                modifyValues(result);
            },
            error: function () {
                alert("error")
            }
        });
    })
});