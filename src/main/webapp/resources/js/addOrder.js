$('document').ready(function(){
    String.prototype.stripTags = function() {
        return this.replace(/<\/?[^>]+>/g, '');
    };

    var replaceHtmlEntities = (function() {
        var translate_re = /&(nbsp|amp|quot|lt|gt);/g;
        var translate = {
            "nbsp": "",
            "amp" : "&",
            "quot": "\"",
            "lt"  : "<",
            "gt"  : ">"
        };
        return function(s) {
            return ( s.replace(translate_re, function(match, entity) {
                return translate[entity];
            }) );
        }
    })();


    $('#addOrder').bind('click', function(){
        var data = {};
        var thumbNailRegex = /<img.+?src=[\"'](.+?)[\"'].*?>/;
        data["orderDescription"] = replaceHtmlEntities(CKEDITOR.instances.editor1.getData());
        data["orderTitle"] = $('#saleItemTitle').val();
        data["orderType"] = $('input[name=orderType]:checked', '#addSaleForm').val();
        var thumbNail = thumbNailRegex.exec(data["orderDescription"]);
        data["orderPhoto"] = (thumbNail == null)? "http://www.pakistancardealers.com/img/no-image.jpg" : thumbNail[1];
        data["orderSmallDescription"] = replaceHtmlEntities(data["orderDescription"]).stripTags().replace(/(<img (.*) \/>)/g, '').replace(/[\n\r]/g, ' ').replace(/\s{2,}/g, ' ').substr(0,250) + "...";
        console.log(data["orderSmallDescription"]);
        data = JSON.stringify(data);
        $.ajax({
            type: 'POST',
            url: '/order/new',
            data: data,
            success: function(data){
                 window.location.href="/sale"
            }
        });
    })
});