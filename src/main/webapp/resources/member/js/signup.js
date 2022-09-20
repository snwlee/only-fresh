$('#member-submit').click(function () {

    if (!(/([\w\.\-_]+)?\w+@[\w-_]+(\.\w+){1,}(\S)/).test($('#email').val())) {
        alert('이메일을 정확히 입력해주세요.');
        $('#email').focus();
        return;
    } else if (!(/^(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{8,}(\S)$/).test($('#pwd').val())) {
        alert('비밀번호를 정확히 입력해주세요.');
        $('#pwd').focus();
        return;
    } else if ($('#cpwd').val() !== $('#pwd').val()) {
        alert('동일한 비밀번호를 입력해주세요.');
        $('#cpwd').focus();
        return;
    } else if (!(/[가-힣]{2,5}(\S)/).test($('#name').val())) {
        alert('유효한 이름을 입력해주세요.');
        $('#name').focus();
        return;
    } else if (!(/^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}(\S)$/).test($('#telno').val())) {
        alert('유효한 휴대폰 번호를 입력해주세요.');
        $('#telno').focus();
        return;
    } else if ($('#addr2').val() === '') {
        alert('주소를 입력해주세요.');
        $('#main_addr-error').prop('hidden', false);
        $('#main_addr-error').focus();
        return;
    } else if (!$("input:radio[class=checkmark]").is(':checked')) {
        $('#gender-error').prop('hidden', false);
        alert('성별을 입력해주세요.');
        return;
    } else if ($('#required-checked').prop('hidden') === false) {
        alert('필수 약관에 동의해주세요.');
        return;
    } else {
        $('#form').submit();
    }
});
$('#email').change(function () {
    if ((/([\w\.\-_]+)?\w+@[\w-_]+(\.\w+){1,}(\S)/).test($(this).val())) {
        $('#email-error').prop('hidden', true);
    } else {
        $('#email-error').prop('hidden', false);
    }
});
$('#pwd').change(function () {
    if ((/^(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{8,}(\S)$/).test($(this).val())) {
        $('#pwd-error').prop('hidden', true);
        if ($(this).val() === $('#cpwd').val()) {
            $('#cpwd-error').prop('hidden', true);
        } else {
            $('#cpwd-error').prop('hidden', false);
        }
    } else {
        $('#pwd-error').prop('hidden', false);
    }
});
$('#cpwd').change(function () {
    if ($(this).val() === $('#pwd').val()) {
        $('#cpwd-error').prop('hidden', true);
    } else {
        $('#cpwd-error').prop('hidden', false);
    }
});
$('#name').change(function () {
    if ((/[가-힣]{2,5}(\S)/).test($(this).val())) {
        $('#name-error').prop('hidden', true);
    } else {
        $('#name-error').prop('hidden', false);
    }
});
$('#telno').change(function () {
    if ((/^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}(\S)$/).test($(this).val())) {
        $('#phone-error').prop('hidden', true);
    } else {
        $('#phone-error').prop('hidden', false);
    }
});
$('#rcmdr_email').change(function () {
    if ((/([\w\.\-_]+)?\w+@[\w-_]+(\.\w+){1,}(\S)/).test($(this).val())) {
        $('#rcmdr-email-error').prop('hidden', true);
    } else {
        $('#rcmdr-email-error').prop('hidden', false);
    }
});

if ($('#gender').val() === 'male') {
    $('#male').prop('checked', true);
} else if ($('#gender').val() === 'female') {
    $('#female').prop('checked', true);
} else {
    $('#none').prop('checked', true);
}

$('#all-checked').click(function () {
    $('.checked').prop('hidden', true);
    $('.unchecked').prop('hidden', false);
    $('#terms').prop('checked', false);
});
$('#all-unchecked').click(function () {
    $('.checked').prop('hidden', false);
    $('.unchecked').prop('hidden', true);
    $('#terms').prop('checked', true);
});
$('#required-checked').click(function () {
    $(this).prop('hidden', true);
    $('#required-unchecked').prop('hidden', false);
});
$('#required-unchecked').click(function () {
    $(this).prop('hidden', true);
    $('#required-checked').prop('hidden', false);
});
$('#selected-checked').click(function () {
    $(this).prop('hidden', true);
    $('#selected-unchecked').prop('hidden', false);
    $('#terms').prop('checked', false);
});
$('#selected-unchecked').click(function () {
    $(this).prop('hidden', true);
    $('#selected-checked').prop('hidden', false);
    $('#terms').prop('checked', true);
});
