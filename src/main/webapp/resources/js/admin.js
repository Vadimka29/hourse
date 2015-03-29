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

    $('#adminAddToBlog').bind('click', function(){
        //var data = {};
        ////var thumbNailRegex = /(src=&quot;(.*)&quot;)/;
        //var thumbNailRegex = /(src="(.*)")/;
        //data["messageBody"] = CKEDITOR.instances.editor1.getData();
        //data["messageTittle"] = $('#saleItemTitle').val();
        //var thumbNail = thumbNailRegex.exec(data["orderDescription"]);
        //data["imageUrl"] = thumbNail[2];
        ////data["orderSmallDescription"] = data["orderDescription"].stripTags().replace(/(<img (.*) \/>)/g, '').replace("\n", '').replace('\t', '').substr(0,250) + "...";

        var data = {};
        var thumbNailRegex = /<img.+?src=[\"'](.+?)[\"'].*?>/;
        data["messageBody"] = replaceHtmlEntities(CKEDITOR.instances.editor1.getData());
        data["messageTittle"] = $('#saleItemTitle').val();
        var thumbNail = thumbNailRegex.exec(data["messageBody"]);
        data["imageUrl"] = (thumbNail == null)? "http://www.pakistancardealers.com/img/no-image.jpg" : thumbNail[1];
        data["messageSmallDescription"] = replaceHtmlEntities(data["messageBody"]).stripTags().replace(/(<img (.*) \/>)/g, '').replace(/[\n\r]/g, ' ').replace(/\s{2,}/g, ' ').substr(0,250) + "...";

        data = JSON.stringify(data);
        $.ajax({
            type: 'POST',
            url: '/add_post_to_blog',
            data: data,
            success: function(data){
                window.location.href="/admin"
            }
        });
    })

$('.addOrder.admin .item img').click(function(){
    $(this).css('opacity','0.4');
});
});