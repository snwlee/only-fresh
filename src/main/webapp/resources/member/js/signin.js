$('#member-submit').click(function () {
    $('#form').submit();
});

$('#email').change(function () {
    if ((/([\w\.\-_]+)?\w+@[\w-_]+(\.\w+){1,}/).test($(this).val())) {
        $('#email-error').prop('hidden', true);
    } else {
        $('#email-error').prop('hidden', false);
    }
});
$('#pwd').change(function () {
    if ((/^(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-]).{8,}$/).test($(this).val())) {
        $('#pwd-error').prop('hidden', true);
    } else {
        $('#pwd-error').prop('hidden', false);
    }
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
