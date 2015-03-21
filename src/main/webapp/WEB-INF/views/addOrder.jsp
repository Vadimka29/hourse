<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/resources/css/horse_clubs.css">
        <link rel="stylesheet" href="/resources/css/mainsheet.css">
        <link rel="stylesheet" href="/resources/css/fontawesome.css">
        <link rel="stylesheet" href="/resources/css/addOrder.css">
        <script src="/resources/js/jquery.js"></script>
        <script src="/resources/js/locale.js"></script>
        <script src="/resources/js/mainPage.js"></script><script src="/resources/js/locale.js"></script>
        <script src="/resources/js/ckeditor/ckeditor.js"></script>
        <script src="/resources/js/addOrder.js"></script>
        <script type="text/javascript" src="/resources/ckfinder/ckfinder.js"></script>

    </head>
    <body>
        <div class="container">
            <div class="page-wrapper">
                <jsp:include page="header.jsp"/>
                <div class="row mainBlockWrapper">
                    <div class="cols col-8 centered">
                            <div class="mainBlock addOrder">
                            <h3 class="blockTitle"><span class="locale" data-name="sale_new_title"></span></h3>
                            <div class="logoSmall">
                                <img src="/resources/img/cartSmall3.png" alt="">
                            </div>
                            <div class="row">
                                <form method="post" id="addSaleForm">
                                    <div class="cols col-12">
                                        <h3 class="title"><span class="locale" data-name="add_order__order_title"></span></h3>
                                        <textarea id="saleItemTitle" name="saleItemTitle"></textarea>
                                    </div>
                                    <div class="cols col-12 orderType">
                                        <h3 class="title"><span class="locale" data-name="add_order__order_category"></span><br/></h3>
                                        <input type="radio" name="orderType" value="horses"><span class="locale" data-name="add_order__order_category__horses"></span><Br>
                                        <input type="radio" name="orderType" value="transport"><span class="locale" data-name="add_order__order_category__transport"></span><Br>
                                        <input type="radio" name="orderType" value="ammunition"><span class="locale" data-name="add_order__order_category__ammunition"></span><Br>
                                        <input type="radio" name="orderType" value="etc"><span class="locale" data-name="add_order__order_category__various"></span><Br>
                                    </div>


                                    <div class="cols col-12">
                                        <h3 class="title"><span class="locale" data-name="add_order__order_description"></span></h3>

                                        <textarea id="editor1" name="editor1" rows="10" cols="80"></textarea>
                                        <ckfinder:setupCKEditor basePath="/resources/ckfinder/" editor="editor1" />
                                        <ckeditor:replace replace="editor1" basePath="/resources/js/ckeditor/" />

                                        <div id="addOrder" class="submit"><span class="locale" data-name="add_button"></span></div>
                                    </div>
                                </form>
                            </div>

                            </div>
                    </div>
                </div>          
            </div>



            <jsp:include page="footer.jsp"/>
        </div>
    </body>
    <%--<script>--%>
        <%--$(document).ready(function(){--%>
            <%--CKEDITOR.replace( 'editor1', {--%>
                <%--extraPlugins: 'image2,video',--%>
                <%--extraAllowedContent: 'video[*]{*};source[*]{*}',--%>
                <%--skin : 'icy_orange',--%>
                <%--filebrowserBrowseUrl: '/resources/ckfinder/',--%>
                <%--filebrowserWindowWidth: '860',--%>
                <%--filebrowserWindowHeight: '660'--%>
            <%--} )--%>
        <%--});--%>
    <%--</script>--%>

</html>