<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>
    <link rel="stylesheet" href="/resources/css/horse_clubs.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/css/gallery.css">
    <script src="/resources/js/gamma/modernizr.custom.70736.js"></script>
    <script src="/resources/js/jquery.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script>
    <script src="/assets/gmap3.js?body=1" type="text/javascript"></script>
    <script src="/resources/js/map.js"></script>
    <%--порядок важен--%>
    <script src="/resources/js/jquery.js"></script>
    <script src="/resources/js/common.js"></script>
    <script src="/resources/js/locale.js"></script>
    <script src="/resources/js/adaptive.js"></script>
</head>
<body>
<div class="container">
    <div class="page-wrapper">
        <jsp:include page="../header.jsp"/>
        <div class="row mainBlockWrapper contacts">
            <div class="cols col-8 centered">
                <ul>
                    <li><span>Юридический адрес</span> - Полтавская область, Лубенский район, с.Засулье ул.Комсомольская 63</li>
                    <li><span>Факс</span> - 053615 3311</li>
                    <li><span>E-mail</span> - ananko.vs@gmail.com</li>
                </ul>

                <div class="map">

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../footer.jsp"/>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="/resources/js/locale.js"></script>

</body>
</html>
