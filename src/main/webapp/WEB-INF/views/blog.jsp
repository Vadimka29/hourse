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
    <script src="/resources/js/mainPage.js"></script>
</head>
<body>
<%
    response.setHeader( "Pragma", "no-cache" );
    response.setHeader( "Cache-Control", "no-cache" );
    response.setDateHeader( "Expires", 0 );
%>
<div class="container">
    <div class="page-wrapper">
            <jsp:include page="header.jsp"/>
        <div class="row mainBlockWrapper">
            <div class="cols col-8 centered">
                <div class="mainBlock blog">
                    <h3 class="blockTitle">Блог</h3>

                    <div class="logoSmall">
                        <img src="/resources/img/chat.png" alt="">
                    </div>
                    <div class="row">
                        <!--Тут пилить эту фигню-->
                        <%
                            ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
                            BlogDAO blogDAO = (BlogDAO) context.getBean("blogDAO");
                            String pageIndexString =(String) request.getAttribute("pageNumber");
                            System.out.println(pageIndexString);
                            Integer pageIndex = null;
                            if(pageIndexString != null && !pageIndexString.isEmpty()) {
                                pageIndex = Integer.parseInt(pageIndexString);
                            } else {
                                pageIndex = 1;
                            }
                            List<BlogEntity> posts = (List<BlogEntity>) blogDAO.getPosts(pageIndex);
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
                                        <span class="openPost"><a href="/blog/post/<%=post.getMessageId()%>">Подробнее</a></span>
                                    </div>
                                    <p><%=post.getMessageBody()%></p>
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
                                int pageCount = (int) Math.ceil(blogDAO.getCount()/10.0);
                                for(int i = 1; i <= pageCount; i++){
                            %>
                            <li><a href="/blog/<%=i%>"><%=i%></a></li>
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
</body>
</html>
