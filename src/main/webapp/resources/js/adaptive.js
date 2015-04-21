function showSubMenu(){
    $('.subMenu').fadeIn();
}

function closeSubMenu() {
    $('.subMenu').fadeOut();
}

$(document).ready(function(){
    var buf = null;
    $('.subMenu .head .fa').click(function(){
        if ($(this).hasClass('fa-caret-up')){
            console.log("down");
            $(this).parent("li").find('ul').hide();
            $(this).removeClass('fa-caret-up').addClass('fa-caret-down');
        }
        else{
            console.log("up")
            $(this).parent("li").find('ul').fadeIn("slow");
            $(this).removeClass('fa-caret-down').addClass('fa-caret-up');
        }
    });
});