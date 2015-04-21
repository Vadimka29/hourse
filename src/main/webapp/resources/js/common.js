$(document).ready(function () {
    function getCookie(name){
        var matches = document.cookie.match(new RegExp(
            "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
        ));
        return matches ? decodeURIComponent(matches[1]) : undefined;
    }
    if (getCookie("isAuth") != "unregistered" && getCookie("isAuth") != undefined){
        console.log(getCookie("isAuth"));
        $('.registrationLink').attr('href','/logout');
        $('.registrationLink').find('.locale').attr('data-name','footer_logout');
        $('.addNewSale').css('display','inline-block');

        $(".helloMsg").html('<i class="fa fa-user"></i><span class="locale" data-name="header_helloMsg"></span>' + getCookie("isAuth"));

    }else{
        $(".helloMsg").css('display', 'none');
        $('.addNewSale').css('display','none');
    }

});

$('.cke_dialog .cke_browser_webkit .cke_ltr').ready(function(){
    $('#cke_76_label').parent().parent().css('display','none');
});