<%@page import="ua.com.iweb.enteties.BlogEntity" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Календарь | Федерация конного спорта Полтавы</title>
    <%--<link rel="stylesheet" type="text/css" href="/resources/css/calendar_style.css"/>--%>
    <link rel="stylesheet" href="/resources/css/horse_clubs.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/css/gallery.css">
    <script src="/resources/js/gamma/modernizr.custom.70736.js"></script>

    <%--порядок важен--%>
    <script src="/resources/js/jquery.js"></script>
    <script src="/resources/js/common.js"></script>
    <script src="/resources/js/locale.js"></script>
    <script src="/resources/js/adaptive.js"></script>
</head>
<body>
<div class="container">
    <div class="page-wrapper salePage">
        <jsp:include page="../header.jsp"/>
        <div class="row mainBlockWrapper singlePage">
            <div class="cols col-8 centered">
                <div class="mainBlock">
                    <h3 class="blockTitle"><span class="locale" data-name="calendar_title"></span></h3>
                    <div class="logoSmall">
                        <img src="/resources/img/calendarSmall.png" alt="">
                    </div>



                    <link rel='stylesheet' type='text/css' href='/resources/js/fullcalendar/css/style.css' />
                    <link rel='stylesheet' type='text/css' href='/resources/js/fullcalendar/css/fullcalendar.css' />
                    <link rel='stylesheet' type='text/css' href='/resources/js/fullcalendar/css/jquery-ui-1.8.11.custom.css' />
                    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
                    <script src="/resources/js/fullcalendar/js/jquery-ui-1.8.11.custom.min.js"></script>
                    <script src='/resources/js/fullcalendar/js/fullcalendar.min.js'></script>
                    <script src="/resources/js/fullcalendar/js/jquery-ui-timepicker-addon.js"></script>
                    <script src="/resources/js/calendar.js"></script>
                    <%--<script>--%>
                    <%--$.ajax({--%>
                    <%--url: "/rest/calendar",--%>
                    <%--type: "POST",--%>
<%--//                    dataType: "application/json",--%>
                    <%--success: function (data) {--%>
                    <%--console.log(data);--%>
                    <%--},--%>
                                                <%--error: function(data){--%>
                                                    <%--console.log(data);--%>
                                                <%--}--%>
                    <%--});--%>
                    <%--</script>--%>


                    <div id="calendar"></div>
                    <%--<button id="add_event_button">Добавить событие</button>--%>
                    <div id="dialog-form" title="Событие">
                        <p class="validateTips"></p>
                        <form>
                            <p><label for="event_type">Тип события</label>
                                <input type="text" id="event_type" name="event_type" value="" readonly="readonly" ></p>
                            <p><label for="event_start">Начало</label>
                                <input type="text" name="event_start" id="event_start" readonly="readonly"/></p>
                            <p><label for="event_end">Конец</label>
                                <input type="text" name="event_end" id="event_end" readonly="readonly"/></p>
                            <input type="hidden" name="event_id" id="event_id" value="">
                        </form>
                    </div>








                    <div class="logoSmall second">
                        <img src="/resources/img/calendarSmall.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../footer.jsp"/>

</div>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>--%>
<%--<script src="/resources/js/jquery.js"></script>--%>
<script src="/resources/js/locale.js"></script>

</body>
</html>
