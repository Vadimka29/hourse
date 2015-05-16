//$('document').ready(function(){
//    $('.submit.loginAction').bind('click',function(){
//        var data = {};
//        data["login"] = $('#loginActionLogin').val();
//        data["password"] = $('#loginActionPassword').val();
//        data = JSON.stringify(data);
//        $.ajax({
//            type: 'POST',
//            url: 'login_post',
//            data: data,
//            success: function(data){
//                window.location.href="/";
//            }
//        });
//    });
//});
var data = {};

function hidePopup(){
    $(".popUp").fadeOut("fast");
    setTimeout(removePopup,500);
    $(".container").removeClass("blured");
    console.log(data);
    $.ajax({
        type: 'POST',
        url: 'register_post',
        data: data,
        async:false,
        success: function(data){
            window.location.href="/";
        }
    });


}
function removePopup(){
    $(".popUp").remove();

}

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
                console.log(data);
                //window.location.href="/";
            }
        });
    });

    $('.submit.registerAction').bind('click',function(){
        //var data = {};
        data["userName"] = $('#registerActionName').val();
        data["userPhone"] = $('#registerActionPhoneNumber').val();
        data["userEmail"] = $('#registerActionEmail').val();
        data["userLogin"] = $('#registerActionLogin').val();
        data["userPass"] = $('#registerActionPassword').val();
        data = JSON.stringify(data);
        showPopup("thanks");
        //$.ajax({
        //    type: 'POST',
        //    url: 'register_post',
        //    data: data,
        //    success: function(data){
        //        //window.location.href="/";
        //    }
        //});
    });




//function showPopup(input){
//    $(".container").addClass("blured");
//    $("body").append('<div class="popUp"> <div class="popUpCloseButton" onclick="hidePopup()"><i class="fa fa-close "></i></div><div class="popUpWrapper"> <img  src="'+input+'" alt=""/></div></div>');
//    $(".popUp").fadeIn("slow");
//}
function showPopup(input) {
    $(".container").addClass("blured");


    switch (input) {
        case "thanks":
            $("body").append('<div class="popUp" > ' +
            '                <div class="popUpCloseButton" onclick="hidePopup()">' +
            '                    <i class="fa fa-close "></i>' +
            '                </div>' +
            '                        <div class="popUpWrapper">' +
            '                            <div class="popUpMsg" style="margin-top:10em;"> ' +
            '                                <p>Добро пожаловать! Благодарим за регистрацию, теперь Вы имеете возможность размещать объявления в отделе продаж!</p>' +
            '                                <a class="orderButton transition" href="/">На главную</a>' +
            '                            </div>' +
            '                        </div>' +
            '                </div>');
            break
        case "order":
            $("body").append('' +
            '<div class="popUp"> ' +
            '                <div class="popUpCloseButton" onclick="hidePopup()">' +
            '                    <i class="fa fa-close "></i>' +
            '                </div>' +
            '                        <div class="popUpWrapper">' +
            '                            <div class="popUpMsg"> ' +
            '<div class ="container">' +

            '<div class="cols col-12 footer" id="orderForm">' +

            ' <div class="slogan">' +
            '    <p class="first">Форма заказа </p>' +
            '   <h3 class="separator"></h3>' +
            '</div>' +

            '<div class="row order form1 " >' +
            '       <div class="row clientInfo">' +
            '              <div class="cols col-8 centered">' +
            '                 <div class="cols col-4"><input id="name" class="input transition" type="text" placeholder="Имя"/></div>' +
            '                <div class="cols col-4"><input id="email" class="input transition" type="text" placeholder="E-mail"/></div>' +
            '                                                           <div class="cols col-4 user_phone rfield "><input id="user_phone" class="input transition " type="text" placeholder="+380(__) ___ __ __"/></div>' +
            '          </div>' +
            ' </div>' +
            '</div>' +

            '<div class="row order form2">' +
            '       <div class="cols col-8 centered">' +
            '          <textarea name=""  id="dsc" class="input transition" placeholder="Краткое описание проекта" style="min-height: 10em !important;"></textarea>' +
            '     </div>' +
            '</div>' +

            '<div class="row order thanks">' +
            '  <div class="cols col-12 " >' +
            '     <div class="cols col-8 centered">' +
            '        <div class="cols col-8" style="text-align: left;"><p>Спасибо за сотрудничество!</p></div>' +
            '   <div  class="cols col-4">' +
            '      <a id="send" class="orderButton transition">Отправить</a>' +
            ' </div>' +
            ' </div>' +
            '  </div>' +
            ' </div>' +

            '</div>' +
            ' </div>' +

            '                            </div>' +
            '                        </div>' +
            '                </div>');
            break;
    }
    $(".popUp").fadeIn("slow");


}
});
//}
