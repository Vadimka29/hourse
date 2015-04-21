<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="ua.com.iweb.config.DaoBeanConfig" %>
<%@ page import="org.springframework.context.annotation.AnnotationConfigApplicationContext" %>
<%@ page import="ua.com.iweb.dao.BlogDAO" %>
<%@ page import="ua.com.iweb.enteties.BlogEntity" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: vanya
  Date: 18.03.15
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    <title>Блога | Федерация конного спорта Полтавы</title>
    <link rel="stylesheet" href="/resources/css/horse_clubs.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <link rel="stylesheet" href="/resources/css/fontawesome.css">
    <link rel="stylesheet" href="/resources/css/addOrder.css">
    <script src="/resources/js/jquery.js"></script>
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
        <div class="row mainBlockWrapper">
            <div class="cols col-8 centered">
                <div class="mainBlock blog">
                    <h3 class="blockTitle"><span class="locale" data-name="seminars_title"></span></h3>

                    <div class="logoSmall">
                        <img src="/resources/img/seminarsSmall.png" alt="">
                    </div>
                    <div class="row">
                        <!--Тут пилить эту фигню-->
                        <%
                            ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
                            BlogDAO blogDAO = (BlogDAO) context.getBean("blogDAO");
                            String pageIndexString =(String) request.getAttribute("pageNumber");
                            String type = (String) request.getAttribute("type");
                            System.out.println(pageIndexString);
                            Integer pageIndex = null;
                            if(pageIndexString != null && !pageIndexString.isEmpty()) {
                                pageIndex = Integer.parseInt(pageIndexString);
                            } else {
                                pageIndex = 1;
                            }
                            System.out.println(" type seminar : " + type);
                            List<BlogEntity> posts = (List<BlogEntity>) blogDAO.getPosts(pageIndex, type);
                            for(BlogEntity post: posts){
                        %>
                        <div class="cols col-12 item">
                            <div class="row">
                                <div class="cols col-5 photo">
                                    <img src="<%=post.getImageUrl()%>" alt="">
                                </div>
                                <div class="cols col-7 description">
                                    <h3 class="title"><%=post.getMessageTittle()%></h3>
                                    <div class="cols col-12 preDescription">
                                        <span><i class="fa fa-calendar"></i><%=post.getMessageDate()%></span>
                                        <%--<span><i class="fa fa-comment"></i>10 комментариев</span>--%>
                                        <span class="openPost"><a href="/blog/post/<%=post.getMessageId()%>"><span class="locale" data-name="read_more_button"></span></a></span>
                                    </div>
                                    <p><%=post.getMessageSmallDescription()%></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="horizontalLine"></div>
                            </div>

                        </div>
                        <%
                            }
                        %>



                        <div class="row">
                            <div class="horizontalLine"></div>
                        </div>
                    </div>
                    <div class="pageNav bottom">
                        <ul>
                            <%
                                int pageCount = (int) Math.ceil(blogDAO.getCount(type)/10.0);
                                for(int i = 1; i <= pageCount; i++){
                            %>
                            <li><a href="/seminars/<%=i%>"><%=i%></a></li>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                    <div class="logoSmall second">
                        <img src="/resources/img/seminarsSmall.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer.jsp"/>
</div>
</body>
</html>
