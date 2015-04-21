<%@page import="ua.com.iweb.enteties.BlogEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Запись блога | Федерация конного спорта Полтавы</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/horse_clubs.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/css/gallery.css">
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
        <div class="row mainBlockWrapper singlePage">
            <div class="cols col-8 centered">
                <%
                    BlogEntity blogPost = (BlogEntity) request.getAttribute("post");
                    if(blogPost != null) {
                %>
                <div class="mainBlock">
                    <h3 class="blockTitle"><span class="locale" data-name="single_page_title"></span></h3>
                    <div class="logoSmall">
                        <img src="/resources/img/chat.png" alt="">
                    </div>
                    <p class="saleTitle"><%=blogPost.getMessageTittle()%></p>
                    <div class="saleBody "><%=blogPost.getMessageBody()%></div>
                    <div class="logoSmall second">
                        <img src="/resources/img/chat.png" alt="">
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
