

// mypageAddrModify

$(document).ready(function () {

    $('#removeBtn').on("click", function () {
        // if(!confirm("정말로 삭제하시겠습니까?")) return;
        let form = $('#address_modify_body');
        form.attr("action", "<c:url value='/address/remove'/>?addr_id=${param.addr_id}");
        form.attr("method", "post");
        form.submit();
    });

    $('#modifyBtn').on("click", function () {
        let form = $('#address_modify_body');
        form.attr("action", "<c:url value='/address/modify'/>?addr_id=${param.addr_id}");
        form.attr("method", "post");
        form.submit();
    });
});


// mypageAddrAdd

$(document).ready(function () {  // main()와 같다. jquery

    $('#insertBtn').on("click", function () {
        let form = $('#address_add_body');
        form.attr("action", "<c:url value='/address/create'/>");
        form.attr("method", "post");
        form.submit();
    });

    function telValidator(args) {
        var msg = '전화번호를 제대로 입력해주세요.';

        if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
            return true;
        }
        alert(msg);
        return false;
    }
});


// mypageAddrList

$(document).ready(function () {
    let phone = '${addressDto.addr_tel}';
    $('#phone-${addressDto.addr_id}').text(phone.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`));
});


$('#checkbox-${addressDto.addr_id}').click(function () {
    alert("배송지 선택이 완료되었습니다.");
    $('#form').submit();
});

let msg = "${param.msg}"
if (msg == "WRT_OK") alert("성공적으로 등록되었습니다.");
if (msg == "DEL_OK") alert("성공적으로 삭제되었습니다.");
if (msg == "DEL_ERR") alert("삭제에 실패했습니다.");
if (msg == "INS_OK") alert("성공적으로 등록되었습니다.");
if (msg == "INS_ERR") alert("등록에 실패했습니다.");
