$('document').ready(function(){
    $('.submit.loginAction').bind('click',function(){
        var data = {};
        data["login"] = $('#loginActionLogin').val();
        data["password"] = $('#loginActionPassword').val();
        data = JSON.stringify(data);
        $.ajax({
            type: 'POST',
            url: 'login_post',
            data: data,
            success: function(data){
                window.location.href="/";
            }
        });
    });
})

$('document').ready(function(){
    $('.submit.registerAction').bind('click',function(){
        var data = {};
        data["userName"] = $('#registerActionName').val();
        data["userPhone"] = $('#registerActionPhoneNumber').val();
        data["userEmail"] = $('#registerActionEmail').val();
        data["userLogin"] = $('#registerActionLogin').val();
        data["userPass"] = $('#registerActionPassword').val();
        data = JSON.stringify(data);
        $.ajax({
            type: 'POST',
            url: 'register_post',
            data: data,
            success: function(data){
                window.location.href="/";
            }
        });
    });
})