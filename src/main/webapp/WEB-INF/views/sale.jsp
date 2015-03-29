<%@ page import="ua.com.iweb.enteties.HourseOrderEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.annotation.AnnotationConfigApplicationContext" %>
<%@ page import="ua.com.iweb.config.DaoBeanConfig" %>
<%@ page import="ua.com.iweb.dao.OrderDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>Продажа | Федерация конного спорта Полтавы</title>
    <link rel="stylesheet" href="/resources/css/horse_clubs.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/css/addOrder.css">
    <script src="/resources/js/jquery.js"></script>
    <script src="/resources/js/locale.js"></script>
    <script src="/resources/js/mainPage.js"></script>
    <script src="/resources/js/adaptive.js"></script>
</head>
<body>
<script>

   function getCookie(name){
       var results = document.cookie.match('(^|;)?' + name + '=([^;]*)(;|$)');
       if (results)
        return (unescape(results[2]))
       else
        return null;
   }

    $(document).ready(function () {
        if (getCookie("isAuth")){
            $(".addNewSale").css('display','inline-block');
        }else{
            $(".addNewSale").css('display','none');
        }
    });

</script>
<div class="container">
    <div class="page-wrapper">
        <jsp:include page="header.jsp"/>
        <div class="row mainBlockWrapper">
            <div class="cols col-8 centered">
                <div class="mainBlock sale">
                    <h3 class="blockTitle"><span class="locale" data-name="sale_title"></span> <span  class="addNewSale" onclick="location.href='/order'"><div class="triangle"></div><span class="locale" data-name="sale_title__add_order"></span></span> </h3>

                    <div class="logoSmall">
                        <img src="/resources/img/cartSmall3.png" alt="">
                    </div>
                    <div class="row">

                        <%
                            Boolean status = Boolean.parseBoolean((String) request.getAttribute("is"));
                            System.out.println("Status: " + status.booleanValue());
                            List<HourseOrderEntity> orders = null;
                            if(status != null && status.booleanValue() == true) {
                                orders = (List<HourseOrderEntity>) request.getAttribute("typeList");
                            } else if(status != null && status.booleanValue() == false){
                                orders = (List<HourseOrderEntity>) request.getAttribute("lst");
                            } else {
                                orders = null;
                            }
                            if(orders != null)
                                for(HourseOrderEntity entity: orders){
                        %>
                        <div class="cols col-12 item">
                            <div class="cols col-5 photo">
                                <img src=<%=entity.getOrderPhoto()%>>
                            </div>
                            <div class="cols col-7 description">
                                <h3 class="title"><%=entity.getOrderTitle()%> <%=entity.getOrderDate()%> <span><a href="/sale/post/<%=entity.getOrderId()%>"><span class="locale" data-name="read_more_button"></span></a></span></h3>
                                <p>
                                    <%=entity.getOrderSmallDescription()%>
                                </p>
                                <div class="phone"><i class="fa fa-phone"></i>
                                    <%--<%=entity.getOrderPhone()%>--%>
                                    +380936578456

                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <div class="pageNav bottom">
                        <ul>
                            <%
                                String orderType = (String) request.getAttribute("orderType");
                                int count = (Integer) request.getAttribute("pageCount");
                                int pageCount = (int) Math.ceil(count/10.0);
                                for(int i = 1; i <= pageCount; i++){
                                    if(orderType != null && !orderType.isEmpty()){
                            %>
                            <li><a href="/sale/<%=orderType%>/<%=i%>"><%=i%></a></li>
                            <%
                            } else {
                            %>
                            <li><a href="/sale/<%=i%>"><%=i%></a></li>
                            <%
                                    }
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
</body>
</html>