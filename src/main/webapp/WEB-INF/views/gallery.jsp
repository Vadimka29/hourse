<%@ page import="ua.com.iweb.enteties.GalleryEntity" %>
<%@ page import="java.util.List" %>
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
        <script src="/resources/js/adaptive.js"></script>
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
                            <div class="gamma-container gamma-loading" id="gamma-container">
                                <ul class="gamma-gallery">
                            <%
                                List<GalleryEntity> photos = (List<GalleryEntity>) request.getAttribute("photos");
                                for(GalleryEntity photo: photos){
                            %>

                                    <li>
                                        <div data-alt="img03" data-description="<h3>Sky high</h3>" data-max-width="1800" data-max-height="1350">
                                            <div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="1300"></div>
                                            <div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="1000"></div>
                                            <div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="700"></div>
                                            <div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="300"></div>
                                            <div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="200"></div>
                                            <div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>" data-min-width="140"></div>
                                            <div data-src="/resources/uploads/gallery/<%=photo.getDescription()%>"></div>
                                            <noscript>
                                                <img src="/resources/uploads/gallery/<%=photo.getDescription()%>" alt="img03"/>
                                            </noscript>
                                        </div>
                                    </li>
                            <%
                                }
                            %>


                                </ul>
                                <div class="gamma-overlay"></div>
                            </div>
                        </div><!-- main. end of photoGallery-->
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
                        </div>
                    </div>
                </div>          
            </div>

            <jsp:include page="footer.jsp"/>

        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script src="/resources/js/gamma/jquery.masonry.min.js"></script>
        <script src="/resources/js/gamma/jquerypp.custom.js"></script>
        <script src="/resources/js/gamma/gamma.js"></script>
        <%--<script src="/resources/js/jquery.js"></script>--%>
        <script src="/resources/js/locale.js"></script>

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
    </body>
</html>
