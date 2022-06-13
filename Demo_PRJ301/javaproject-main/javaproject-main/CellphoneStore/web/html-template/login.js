$('#password, #repassword').on('keyup', function(){
    if ($('#password').val() == $('#repassword').val()) {
        $('#message').html('Mật khẩu hợp lệ').css('color','green');
    } else {
        $('#message').html('Mật khẩu không hợp lệ').css('color','red');
    }
})