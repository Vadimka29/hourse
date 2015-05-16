<%@ page import="ua.com.iweb.enteties.GalleryEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="ua.com.iweb.config.ServicePath" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Галерея | Федерация конного спорта Полтавы</title>
        <link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>
        <link rel="stylesheet" href="/resources/css/horse_clubs.css">
        <link rel="stylesheet" href="/resources/css/mainsheet.css">
        <link rel="stylesheet" href="/resources/css/fontawesome.css">
        <link rel="stylesheet" href="/resources/css/gallery.css">
        <script src="/resources/js/gamma/modernizr.custom.70736.js"></script>


    </head>
    <body>
        <div class="container">
            <div class="page-wrapper gallery">
              <jsp:include page="header.jsp"/>
                <div class="row mainBlockWrapper">
                    <div class="cols col-8 centered">
                            <%--<div class="horizontalLine"></div>--%>

                            <div class="mainBlock">
                            <h3 class="blockTitle"><span class="locale" data-name="gallery_title"></span></h3>
                            <div class="logoSmall">
                                <img src="/resources/img/galeryNew.png" alt="">
                            </div>


                             <%--<div class="pageNav top">--%>
                                <%--<ul>--%>
                                    <%--<li class="active">1</li>--%>
                                    <%--<li>2</li>--%>
                                    <%--<li>3</li>--%>
                                <%--</ul>--%>
                            <%--</div>--%>
                                <div class="main photoGallery">

                                    <%
                                        List<GalleryEntity> photos = (List<GalleryEntity>) request.getAttribute("photos");
                                        for(GalleryEntity photo: photos){
                                    %>
                                    <div class="item" style="background:url('/get-gallery?name=<%=photo.getDescription()%>'); background-size:cover;" data-image="/get-gallery?name=<%=photo.getDescription()%>" data-description="<%=photo.getSecondTitle()%>">
                                        <div class="description" ><div><span><%=photo.getTitle()%></span></div></div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>



                                    <%--<li>--%>
                                        <%--<div data-alt="img03" data-description="<h3>Sky high</h3>" data-max-width="1800" data-max-height="1350">--%>
                                            <%--<div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="1300"></div>--%>
                                            <%--<div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="1000"></div>--%>
                                            <%--<div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="700"></div>--%>
                                            <%--<div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="300"></div>--%>
                                            <%--<div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="200"></div>--%>
                                            <%--<div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="140"></div>--%>
                                            <%--<div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>"></div>--%>
                                            <%--<noscript>--%>
                                                <%--<img src="/resources/uploads/gallery/<%=photo.getDescription()%>" alt="img03"/>--%>
                                            <%--</noscript>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>



                        <%--</div><!-- main. end of photoGallery-->--%>
                                <div class="pageNav bottom">
                                    <ul>
                                        <%
                                            Integer count = (Integer) request.getAttribute("count");
                                            int pageCount = (int) Math.ceil(count/10.0);
                                            for(int i = 1; i <= pageCount; i++){
                                        %>
                                        <li><a href="/gallery/<%=i%>"><%=i%></a></li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>
                                <div class="logoSmall second">
                                    <img src="/resources/img/galeryNew.png" alt="">
                                </div>
                        </div>
                    </div>
                </div>          
            </div>

            <jsp:include page="footer.jsp"/>

        </div>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="/resources/js/gamma/jquery.masonry.min.js"></script>
        <script src="/resources/js/gamma/jquerypp.custom.js"></script>
        <script src="/resources/js/gamma/gamma.js"></script>
        <%--<script src="/resources/js/jquery.js"></script>--%>

        <script type="text/javascript">
            $(function() {
                var GammaSettings = {
                //      viewport : [ {
                //     width : 1200,
                //     columns : 4
                // }, {
                //     width : 900,
                //     columns : 3
                // }, {
                //     width : 500,
                //     columns : 2
                // }, {
                //     width : 320,
                //     columns : 2
                // }, {
                //     width : 0,
                //     columns : 1
                // } ]
                        viewport : [ {
                            width : 1200,
                            columns : 5
                        }, {
                            width : 900,
                            columns : 4
                        }, {
                            width : 500,
                            columns : 3
                        }, { 
                            width : 320,
                            columns : 2
                        }, { 
                            width : 0,
                            columns : 2
                        } ]
                };

                Gamma.init( GammaSettings );

            });
        </script>
        <%--порядок важен--%>
        <script src="/resources/js/common.js"></script>
        <script src="/resources/js/locale.js"></script>
        <script src="/resources/js/adaptive.js"></script>
        <script>
            var imagesSet = [];
            var imagesDescriptionSet = [];
            var tempImageNumber = null;

            $(document).ready(function(){
                imagesSet = getAllImages();
                imagesDescriptionSet = getAllImagesDescription();

                $('.photoGallery .item').click(function(){
                    var tempImage = $(this).data().image;
                    var tempImageDescription = $(this).data().description;
                    tempImageNumber = imagesSet.indexOf(tempImage);
                    showPopup(tempImage);
                });
            });

            $(document).on( 'click', '.leftArrow', function () {
                tempImageNumber -= 1;
                if (tempImageNumber < 0 )
                    tempImageNumber = imagesSet.length-1;
                renderImage(tempImageNumber);
            }).on( 'click', '.rightArrow', function () {
                tempImageNumber += 1;
                if (tempImageNumber > imagesSet.length-1 )
                    tempImageNumber = 0;
                renderImage(tempImageNumber);
            });




            function getAllImages(){
                var temp = [];
                $('.photoGallery .item').each(function(){
                    temp.push($(this).data().image);
                });
                return temp;

            }

            function getAllImagesDescription(){
                var temp = [];
                $('.photoGallery .item').each(function(){
                    temp.push($(this).data().description);
                });
                return temp;

            }




            function renderImage(input){
                console.log(input);
                // $('.popUp img').attr("src", imagesSet[input]);
                var img = $('.popUp img');
                img.fadeOut(300, function() {
                    img.attr("src", imagesSet[input]);
                    img.fadeIn(300);
                });
                var description = $('.popUp .descriptionWrapper');
                description.fadeOut(300, function() {
                    description.text(imagesDescriptionSet[input]);
                    description.fadeIn(300);
                });
            }

            function removePopup(){
                $(".popUp").remove();

            }
            function hidePopup(){
                $(".popUp").fadeOut("fast");
                setTimeout(removePopup,500);
                $(".container").removeClass("blured");

            }


            function showPopup(input){
                $(".container").addClass("blured");
                $("body").append('<div class="popUp"> ' +
                '<div class="leftArrow arrow"><div></div></div>'+
                '<div class="rightArrow arrow"><div></div></div>'+
                '                <div class="popUpCloseButton" onclick="hidePopup()">' +
                '                    <i class="fa fa-close "></i>' +
                '                </div>' +
                    // '                        <div class="popUpWrapper">' +
                '                                <div class="imgWrapper"><img src="' + input + '"/></div>' +
                '                                <div class="descriptionWrapper">' + imagesDescriptionSet[tempImageNumber] + '</div>                                                       '+
                    // '                        </div>' +
                '                </div>');

                $(".popUp").fadeIn("slow");




            }

        </script>
    </body>
</html>
