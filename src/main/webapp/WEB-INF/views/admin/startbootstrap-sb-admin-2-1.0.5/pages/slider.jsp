
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.annotation.AnnotationConfigApplicationContext" %>
<%@ page import="ua.com.iweb.dao.SliderDAO" %>
<%@ page import="ua.com.iweb.config.DaoBeanConfig" %>
<%@ page import="ua.com.iweb.enteties.SliderEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>


    <link rel="stylesheet" href="/resources/css/addOrder.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="/resources/js/admin.js"></script>
    <script>
        $(document).ready(function(){
            var buf = "";
            $('.addOrder.gallery .item img').click(function () {

                buf += $(this).prop('alt') + " ";
            });

            $('.removeButton').click(function(){
                var data = buf;
                $.ajax({
                    type: 'POST',
                    url: '/remove_from_slider',
                    data: data,
                    success: function(data){
//                   window.location.href="/admin/slider"
                    },
                    error: function () {
                        console.log(data);
                    }
                });
            });
        });
        $(document).ready(function(){
            CKEDITOR.replace( 'editor1', {
                extraPlugins: 'image2,video',
                extraAllowedContent: 'video[*]{*};source[*]{*}'
            } )
        });
    </script>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Панель администратора</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <!-- <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li> -->
                <li><a href="#">Главная</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Меню <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/admin/add_to_blog">Блог</a></li>
                        <li><a href="/admin/gallery">Галерея</a></li>
                        <li><a href="/admin/slider">Слайдер</a></li>
                        <li><a href="/admin/calendar">Календаря</a></li>
                    </ul>
                </li>
            </ul>
            <!--  <form class="navbar-form navbar-left" role="search">
               <div class="form-group">
                 <input type="text" class="form-control" placeholder="Search">
               </div>
               <button type="submit" class="btn btn-default">Submit</button>
             </form> -->
            <!-- <ul class="nav navbar-nav navbar-right">
              <li><a href="#">Link</a></li>
            </ul> -->
        </div>
    </div>
</nav>

<div class="row">
    <div id="page-wrapper" style="width:90%">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Заполнение слайдера
                    <a href="#" class="btn btn-danger removeButton" style="float: right;">Удалить</a>
                    <a onclick="$('#addPhotosForm').submit()" class="btn btn-primary" style="margin-right:1em;float:right;">Добавить</a>
                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row addOrder admin gallery">
            <div class="row">
                <div class="row">
                    <form action="/add_to_slider"  id="addPhotosForm" method="post" enctype="multipart/form-data" style="margin-bottom:6em;">
                        <%--<input type="file" multiple name="gallery_item"/>--%>
                        <div class="form-group">
                            <%--<label class="control-label" for="focusedInput1"></label>--%>
                            <input class="form-control" name="slider_item" type="file" style="margin-left: 0;" multiple>

                        </div>
                    </form>
                </div>

                <div class="row">
                    <%
                        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
                        SliderDAO sliderDAO = (SliderDAO) context.getBean("sliderDAO");
                        List<SliderEntity> photos = sliderDAO.getPhotos();
                        for(SliderEntity photo: photos){
                    %>
                    <div class="item" style="width: 31.33333333%">
                        <img src="/resources/uploads/slider/<%=photo.getDescription()%>" alt="<%=photo.getDescription()%>"/>
                    </div>
                    <%
                        }
                    %>


                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
</div>
</div>
</body>
</html>
<%--<html lang="en">--%>

<%--<head>--%>

    <%--<meta charset="utf-8">--%>
    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <%--<meta name="description" content="">--%>
    <%--<meta name="author" content="">--%>

    <%--<title>Панель администратор</title>--%>
    <%--<!-- Bootstrap Core CSS -->--%>
    <%--<link href="/resources/admin/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">--%>

    <%--<!-- MetisMenu CSS -->--%>
    <%--<link href="/resources/admin/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">--%>

    <%--<!-- Timeline CSS -->--%>
    <%--<link href="/resources/admin/dist/css/timeline.css" rel="stylesheet">--%>

    <%--<!-- Custom CSS -->--%>
    <%--<link href="/resources/admin/dist/css/sb-admin-2.css" rel="stylesheet">--%>

    <%--<!-- Morris Charts CSS -->--%>
    <%--<link href="/resources/admin/bower_components/morrisjs/morris.css" rel="stylesheet">--%>

    <%--<!-- Custom Fonts -->--%>
    <%--<link href="/resources/admin/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">--%>


    <%--<link rel="stylesheet" href="/resources/css/addOrder.css">--%>
    <%--<link rel="stylesheet" href="/resources/css/mainsheet.css">--%>
    <%--<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->--%>
    <%--<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->--%>
    <%--<!--[if lt IE 9]>--%>
    <%--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>--%>
    <%--<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--%>
    <%--<![endif]-->--%>

<%--</head>--%>

<%--<body>--%>

<%--<div id="wrapper">--%>

    <%--<!-- Navigation -->--%>
    <%--<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">--%>
        <%--<div class="navbar-header">--%>
            <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">--%>
                <%--<span class="sr-only">Toggle navigation</span>--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
                <%--<span class="icon-bar"></span>--%>
            <%--</button>--%>
            <%--<a class="navbar-brand" href="index.html">Панель администратора</a>--%>
        <%--</div>--%>
        <%--<!-- /.navbar-header -->--%>

        <%--<ul class="nav navbar-top-links navbar-right">--%>
            <%--<li class="dropdown">--%>
                <%--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--%>
                    <%--<i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>--%>
                <%--</a>--%>
                <%--<ul class="dropdown-menu dropdown-messages">--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<strong>John Smith</strong>--%>
                                    <%--<span class="pull-right text-muted">--%>
                                        <%--<em>Yesterday</em>--%>
                                    <%--</span>--%>
                            <%--</div>--%>
                            <%--<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<strong>John Smith</strong>--%>
                                    <%--<span class="pull-right text-muted">--%>
                                        <%--<em>Yesterday</em>--%>
                                    <%--</span>--%>
                            <%--</div>--%>
                            <%--<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<strong>John Smith</strong>--%>
                                    <%--<span class="pull-right text-muted">--%>
                                        <%--<em>Yesterday</em>--%>
                                    <%--</span>--%>
                            <%--</div>--%>
                            <%--<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a class="text-center" href="#">--%>
                            <%--<strong>Read All Messages</strong>--%>
                            <%--<i class="fa fa-angle-right"></i>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<!-- /.dropdown-messages -->--%>
            <%--</li>--%>
            <%--<!-- /.dropdown -->--%>
            <%--<li class="dropdown">--%>
                <%--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--%>
                    <%--<i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>--%>
                <%--</a>--%>
                <%--<ul class="dropdown-menu dropdown-tasks">--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<p>--%>
                                    <%--<strong>Task 1</strong>--%>
                                    <%--<span class="pull-right text-muted">40% Complete</span>--%>
                                <%--</p>--%>
                                <%--<div class="progress progress-striped active">--%>
                                    <%--<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">--%>
                                        <%--<span class="sr-only">40% Complete (success)</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<p>--%>
                                    <%--<strong>Task 2</strong>--%>
                                    <%--<span class="pull-right text-muted">20% Complete</span>--%>
                                <%--</p>--%>
                                <%--<div class="progress progress-striped active">--%>
                                    <%--<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">--%>
                                        <%--<span class="sr-only">20% Complete</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<p>--%>
                                    <%--<strong>Task 3</strong>--%>
                                    <%--<span class="pull-right text-muted">60% Complete</span>--%>
                                <%--</p>--%>
                                <%--<div class="progress progress-striped active">--%>
                                    <%--<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">--%>
                                        <%--<span class="sr-only">60% Complete (warning)</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<p>--%>
                                    <%--<strong>Task 4</strong>--%>
                                    <%--<span class="pull-right text-muted">80% Complete</span>--%>
                                <%--</p>--%>
                                <%--<div class="progress progress-striped active">--%>
                                    <%--<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">--%>
                                        <%--<span class="sr-only">80% Complete (danger)</span>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a class="text-center" href="#">--%>
                            <%--<strong>See All Tasks</strong>--%>
                            <%--<i class="fa fa-angle-right"></i>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<!-- /.dropdown-tasks -->--%>
            <%--</li>--%>
            <%--<!-- /.dropdown -->--%>
            <%--<li class="dropdown">--%>
                <%--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--%>
                    <%--<i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>--%>
                <%--</a>--%>
                <%--<ul class="dropdown-menu dropdown-alerts">--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<i class="fa fa-comment fa-fw"></i> New Comment--%>
                                <%--<span class="pull-right text-muted small">4 minutes ago</span>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<i class="fa fa-twitter fa-fw"></i> 3 New Followers--%>
                                <%--<span class="pull-right text-muted small">12 minutes ago</span>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<i class="fa fa-envelope fa-fw"></i> Message Sent--%>
                                <%--<span class="pull-right text-muted small">4 minutes ago</span>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<i class="fa fa-tasks fa-fw"></i> New Task--%>
                                <%--<span class="pull-right text-muted small">4 minutes ago</span>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<div>--%>
                                <%--<i class="fa fa-upload fa-fw"></i> Server Rebooted--%>
                                <%--<span class="pull-right text-muted small">4 minutes ago</span>--%>
                            <%--</div>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li>--%>
                        <%--<a class="text-center" href="#">--%>
                            <%--<strong>See All Alerts</strong>--%>
                            <%--<i class="fa fa-angle-right"></i>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<!-- /.dropdown-alerts -->--%>
            <%--</li>--%>
            <%--<!-- /.dropdown -->--%>
            <%--<li class="dropdown">--%>
                <%--<a class="dropdown-toggle" data-toggle="dropdown" href="#">--%>
                    <%--<i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>--%>
                <%--</a>--%>
                <%--<ul class="dropdown-menu dropdown-user">--%>
                    <%--<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>--%>
                    <%--</li>--%>
                    <%--<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>--%>
                    <%--</li>--%>
                    <%--<li class="divider"></li>--%>
                    <%--<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<!-- /.dropdown-user -->--%>
            <%--</li>--%>
            <%--<!-- /.dropdown -->--%>
        <%--</ul>--%>
        <%--<!-- /.navbar-top-links -->--%>

        <%--<div class="navbar-default sidebar" role="navigation">--%>
            <%--<div class="sidebar-nav navbar-collapse">--%>
                <%--<ul class="nav" id="side-menu">--%>
                    <%--<li class="sidebar-search">--%>
                        <%--<div class="input-group custom-search-form">--%>
                            <%--<input type="text" class="form-control" placeholder="Search...">--%>
                                <%--<span class="input-group-btn">--%>
                                <%--<button class="btn btn-default" type="button">--%>
                                    <%--<i class="fa fa-search"></i>--%>
                                <%--</button>--%>
                            <%--</span>--%>
                        <%--</div>--%>
                        <%--<!-- /input-group -->--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/admin"><i class="fa fa-dashboard fa-fw"></i> Главная</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#"><i class="fa fa-files-o fa-fw"></i> Добавление записи<span class="fa arrow"></span></a>--%>
                        <%--<ul class="nav nav-second-level">--%>
                            <%--<li>--%>
                                <%--<a href="/admin/add_to_blog">Блог</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="/admin/addToSale">Продажа</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<!-- /.nav-second-level -->--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/admin/gallery"><i class="fa fa-table "></i> Галерея</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="/admin/slider"><i class="fa fa-photo"></i> Слайдер</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<!-- /.sidebar-collapse -->--%>
        <%--</div>--%>
        <%--<!-- /.navbar-static-side -->--%>
    <%--</nav>--%>

    <%--<div id="page-wrapper">--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-12">--%>
                <%--<h1 class="page-header">Добавление в блог</h1>--%>
            <%--</div>--%>
            <%--<!-- /.col-lg-12 -->--%>
        <%--</div>--%>
        <%--<!-- /.row -->--%>
        <%--<div class="row addOrder admin gallery">--%>
            <%--<div class="row">--%>
                <%--<form action="/add_to_slider" method="post" enctype="multipart/form-data">--%>
                <%--<input type="file" name="slider_item"/>--%>
                <%--<button type="submit">добавить</button>--%>
                <%--</form>--%>

                <%--<div class="row">--%>
                <%--<%--%>
                <%--ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);--%>
                <%--SliderDAO sliderDAO = (SliderDAO) context.getBean("sliderDAO");--%>
                <%--List<SliderEntity> photos = sliderDAO.getPhotos();--%>
                <%--for(SliderEntity photo: photos){--%>
                <%--%>--%>
                <%--<div class="item">--%>
                <%--<img src="/resources/uploads/slider/<%=photo.getDescription()%>" alt="<%=photo.getDescription()%>"/>--%>
                <%--</div>--%>
                <%--<%--%>
                <%--}--%>
                <%--%>--%>


<%--<button class="removeButton">remove</button>--%>
                <%--</div>--%>
        <%--</div>--%>
        <%--<!-- /.row -->--%>
    <%--</div>--%>
    <%--<!-- /#page-wrapper -->--%>

<%--</div>--%>
<%--<!-- /#wrapper -->--%>

<%--<!-- jQuery -->--%>
<%--<script src="/resources/admin/bower_components/jquery/dist/jquery.min.js"></script>--%>

<%--<!-- Bootstrap Core JavaScript -->--%>
<%--<script src="/resources/admin/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>--%>

<%--<!-- Metis Menu Plugin JavaScript -->--%>
<%--<script src="/resources/admin/bower_components/metisMenu/dist/metisMenu.min.js"></script>--%>

<%--<!-- Morris Charts JavaScript -->--%>
<%--<!--<script src="../bower_components/raphael/raphael-min.js"></script>--%>
<%--<!--<script src="../bower_components/morrisjs/morris.min.js"></script>-->--%>
<%--<!--<script src="../js/morris-data.js"></script>-->--%>

<%--<!-- Custom Theme JavaScript -->--%>
<%--<script src="/resources/admin/dist/js/sb-admin-2.js"></script>--%>


<%--<script src="/resources/js/ckeditor/ckeditor.js"></script>--%>

<%--<script src="/resources/js/admin.js"></script>--%>
<%--<script>--%>
    <%--$(document).ready(function(){--%>
        <%--var buf = "";--%>
        <%--$('.addOrder.gallery .item img').click(function () {--%>

            <%--buf += $(this).prop('alt') + " ";--%>
        <%--});--%>

        <%--$('.removeButton').click(function(){--%>
            <%--var data = buf;--%>
            <%--$.ajax({--%>
                <%--type: 'POST',--%>
                <%--url: '/remove_from_slider',--%>
                <%--data: data,--%>
                <%--success: function(data){--%>
<%--//                   window.location.href="/admin/slider"--%>
                <%--},--%>
                <%--error: function () {--%>
                    <%--console.log(data);--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>
    <%--});--%>
    <%--$(document).ready(function(){--%>
        <%--CKEDITOR.replace( 'editor1', {--%>
            <%--extraPlugins: 'image2,video',--%>
            <%--extraAllowedContent: 'video[*]{*};source[*]{*}'--%>
        <%--} )--%>
    <%--});--%>
<%--</script>--%>
<%--</body>--%>

<%--</html>--%>

