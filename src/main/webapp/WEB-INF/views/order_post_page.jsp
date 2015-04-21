<%@ page import="ua.com.iweb.enteties.HourseOrderEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Продажа | Федерация конного спорта Полтавы</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/horse_clubs.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/css/gallery.css">
    <link rel="stylesheet" href="/resources/js/ckeditor/contents.css">
    <script src="/resources/js/gamma/modernizr.custom.70736.js"></script>
    <%--порядок важен--%>
    <script src="/resources/js/common.js"></script>
    <script src="/resources/js/locale.js"></script>
    <script src="/resources/js/adaptive.js"></script>
</head>
<body>
<div class="container">
    <div class="page-wrapper salePage">
        <jsp:include page="header.jsp"/>
        <div class="row mainBlockWrapper">
            <div class="cols col-8 centered">

                <%
                    HourseOrderEntity orderPost = (HourseOrderEntity) request.getAttribute("post");
                    if(orderPost != null){
                %>
                <div class="mainBlock singlePage">
                    <h3 class="blockTitle"><span class="locale" data-name="single_page_title"></span></h3>
                    <div class="logoSmall">
                        <img src="/resources/img/cartSmall3.png" alt="">
                    </div>
                    <p class="saleTitle"><%=orderPost.getOrderTitle()%></p>
                    <div class="saleBody "><%=orderPost.getOrderDescription()%></div>
                    <div class="logoSmall second">
                        <img src="/resources/img/cartSmall3.png" alt="">
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<%--<script src="/resources/js/jquery.js"></script>--%>
<script src="/resources/js/locale.js"></script>

</body>
</html>
