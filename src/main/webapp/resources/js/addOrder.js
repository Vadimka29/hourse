$('document').ready(function(){
    var decodeHtmlEntity = function(str) {
        return str.replace(/&#(\d+);/g, function(match, dec) {
            return String.fromCharCode(dec);
        });
    };

    var encodeHtmlEntity = function(str) {
        var buf = [];
        for (var i=str.length-1;i>=0;i--) {
            buf.unshift(['&#', str[i].charCodeAt(), ';'].join(''));
        }
        return buf.join('');
    };
    $('#addOrder').bind('click', function(){
        var data = {};
        var thumbNailRegex = /src=&quot;.*&quot;"/;
        data["orderDescription"] = CKEDITOR.instances.editor1.getData();
        data["orderTitle"] = $('#saleItemTitle').val();
        data["orderType"] = $('input[name=orderType]:checked', '#addSaleForm').val();
        data["orderPhoto"] = "";
        var thumbNail = thumbNailRegex.exec(data["orderDescription"]);
        console.log (thumbNail);

        //var re = /src=&quot;(.*)&quot;/
        //
        //alert( str.match(re) )

        console.log(data["orderDescription"].match(thumbNailRegex));
        //123
        //if ( thumbNail.length > 1 ){
        //    var thumb = thumbNail[1]
        //}
        //else{
        //    //дефолтная пикча
        //    var thumb = ""
        //} data = JSON.stringify(data);
        $.ajax({
            type: 'POST',
            url: '/order/new',
            data: data,
            success: function(data){
                // window.location.href="index.html"
            }
        });
    })
})