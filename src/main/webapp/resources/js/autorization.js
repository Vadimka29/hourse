$('document').ready(function(){
	$('.submit.loginAction').bind('click',function(){
		var data = {};
		data["login"] = $('#loginActionLogin').val();
		data["password"] = $('#loginActionPassword').val();
		data = JSON.stringify(data);
		$.ajax({
  			type: 'POST',
			url: '',
			data: data,
			success: function(data){
			   // window.location.href="index.jsp"
			}
		});
	});
})

$('document').ready(function(){
	$('.submit.registerAction').bind('click',function(){
		var data = {};
		data["name"] = $('#registerActionName').val();
		data["number"] = $('#registerActionPhoneNummber').val();
		data["email"] = $('#registerActionEmail').val();
		data["login"] = $('#registerActionLogin').val();
		data["password"] = $('#registerActionPassword').val();
        data["password2"] = $('#registerActionPassword2').val();
		data = JSON.stringify(data);
		$.ajax({
  			type: 'POST',
			url: '',
			data: data,
			success: function(data){
			   // window.location.href="index.jsp"
			}
		});
	});
})