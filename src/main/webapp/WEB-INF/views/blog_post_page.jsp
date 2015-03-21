<%@page import="ua.com.iweb.enteties.BlogEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
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
                <div class="horizontalLine"></div>
                <%
                    BlogEntity blogPost = (BlogEntity) request.getAttribute("post");
                    if(blogPost != null) {
                %>
                <div class="mainBlock">
                    <h3 class="blockTitle"><span class="locale" data-name="gallery_title"></span></h3>
                    <div class="logoSmall">
                        <img src="/resources/img/galeryNew.png" alt="">
                    </div>
                    <p><%=blogPost.getMessageTittle()%></p>
                    <div><%=blogPost.getMessageBody()%></div>
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
