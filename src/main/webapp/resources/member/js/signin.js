$('#member-submit').click(function () {
    $('#form').submit();
});

$('#email').change(function () {
    $('#email-error').prop('hidden', false);
});
$('#pwd').change(function () {
    $('#pwd-error').prop('hidden', false);
});
$('#cpwd').change(function () {
    $('#cpwd-error').prop('hidden', false);
});
$('#name').change(function () {
    $('#name-error').prop('hidden', false);
});
$('#telno').change(function () {
    $('#phone-error').prop('hidden', false);
});
$('#rcmdr_email').change(function () {
    $('#rcmdr-email-error').prop('hidden', false);
});

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
});
$('#selected-unchecked').click(function () {
    $(this).prop('hidden', true);
    $('#selected-checked').prop('hidden', false);
});
