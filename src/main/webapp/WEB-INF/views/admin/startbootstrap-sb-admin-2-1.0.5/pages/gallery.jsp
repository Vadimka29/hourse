<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.annotation.AnnotationConfigApplicationContext" %>
<%@ page import="ua.com.iweb.config.DaoBeanConfig" %>
<%@ page import="ua.com.iweb.dao.GalleryDAO" %>
<%@ page import="ua.com.iweb.enteties.GalleryEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/resources/css/addOrder.css">
    <link rel="stylesheet" href="/resources/css/mainsheet.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.css">
    <%--<script src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <!-- jQuery -->


    <script src="/resources/js/admin.js"></script>
    <script>
        $(document).ready(function(){

            var buf = "";

            $('.addOrder.gallery .item .imageCheckbox').change(function () {
                buf += $(this).parents(".imgContainer").find('img').prop('alt') + " ";
            });

            $('.removeButton').click(function(){
                var data = buf;
                $.ajax({
                    type: 'POST',
                    url: '/remove_from_gallery',
                    data: data,
                    success: function(data){
                        location.reload();
//                   window.location.href="/admin/gallery"
                    },
                    error: function () {
                        console.log(data);
                    }
                });
            });

            $(".updateButton").click(function(){
                var array = [];

                $(".gallery .item").each(function(){
                    if ($(this).find('.imageCheckbox').attr('checked', true)){
                        var temp = {
                            "photoId": $(this).data().photoid,
                            "createDate": $(this).find(".date").val(),
                            "description": $(this).find("img").prop('alt'),
                            "title": $(this).find(".frontDescription").val(),
                            "secondTitle":$(this).find(".backDescription").val()
                        };
                        array.push(temp);
                    }
                });

            for (var i=0;i<=array.length;i++){
                console.log(array[i]);
                $.ajax({
                    type: 'POST',
                    url: '/update_gallery',
                    data: JSON.stringify(array[i]),
                    success: function(){
//                   window.location.href="/admin/gallery"
                        location.reload();
                    },
                    error: function () {
                        console.log("error");
                    }
                });
            }
            });
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
<div class="container">
<div class="row">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Заполнение галереи
                    <a href="#" class="btn btn-danger removeButton" style="float: right;">Удалить</a>
                    <a href="#"  class="btn btn-success updateButton" style="float: right;margin-right: 1em;">Обновить</a>
                    <a onclick="$('#addPhotosForm').submit()" class="btn btn-primary" style="margin-right:1em;float:right;">Добавить</a>

                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row  addOrder admin gallery">
            <div class="row">
                <form action="/add_to_gallery"  id="addPhotosForm" method="post" enctype="multipart/form-data" style="margin-bottom:6em;">
                    <%--<input type="file" multiple name="gallery_item"/>--%>
                    <div class="form-group">
                        <%--<label class="control-label" for="focusedInput1"></label>--%>
                        <input class="form-control" name="gallery_item" type="file" style="margin-left: 0;" multiple>

                    </div>
                </form>

                <div class="row">
                    <%
                        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
                        GalleryDAO galleryDAO = (GalleryDAO) context.getBean("galleryDAO");
                        List<GalleryEntity> photos = galleryDAO.getAllPhotos();
                        for(GalleryEntity photo: photos){
                    %>
                    <div class="row item" data-photoid="<%=photo.getPhotoId()%>">
                        <div class="imgContainer">
                            <div class="cols col-5">
                                <img src="/resources/uploads/gallery/<%=photo.getDescription()%>" alt="<%=photo.getDescription()%>"/>

                            </div>
                            <div class="cols col-7">
                                <div class="form-group">
                                    <label class="control-label" for="focusedInput1">Название события</label>
                                    <input class="form-control frontDescription" id="focusedInput1" type="text" value="<%=photo.getTitle()%>" style="margin-left: 0">
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="focusedInput2">Описание фото</label>
                                    <input class="form-control backDescription" id="focusedInput2" type="text" value="<%=photo.getSecondTitle()%>" style="margin-left: 0">
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="dateInput">Укажите дату</label>
                                    <input class="form-control date" id="dateInput" type="date" style="margin-left: 0" value="<%=photo.getCreateDate()%>">
                                </div>
                                <div class="form-group">
                                    <div class="checkbox">
                                        <label class="control-label" style="font-size: 1.2em !important">
                                            <input type="checkbox" class="imageCheckbox"> Отметить
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>


                </div>

            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
</div>
</div>

</body>
</html>
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
                <%--<h1 class="page-header">Заполнение галереи</h1>--%>
            <%--</div>--%>
            <%--<!-- /.col-lg-12 -->--%>
        <%--</div>--%>
        <%--<!-- /.row -->--%>
        <%--<div class="row addOrder admin gallery">--%>
            <%--<div class="row">--%>
                <%--<form action="/add_to_gallery" method="post" enctype="multipart/form-data">--%>
                    <%--<input type="file" multiple name="gallery_item"/>--%>
                    <%--<button type="submit">добавить</button>--%>
                <%--</form>--%>

                <%--<div class="row">--%>
                <%--<%--%>
                    <%--ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);--%>
                    <%--GalleryDAO galleryDAO = (GalleryDAO) context.getBean("galleryDAO");--%>
                    <%--List<GalleryEntity> photos = galleryDAO.getAllPhotos();--%>
                    <%--for(GalleryEntity photo: photos){--%>
                <%--%>--%>
                    <%--<div class="row">--%>
                        <%--<div class="item">--%>
                            <%--<div class="cols col-5">--%>
                                <%--<img src="/resources/uploads/gallery/<%=photo.getDescription()%>" alt="<%=photo.getDescription()%>"/>--%>

                            <%--</div>  --%>
                            <%--<div class="cols col-7">--%>
                                <%--<label for="frontCard">Описание события</label>--%>
                                <%--<input type="text" id="frontCard"/>--%>
                                <%--<label for="backCard">Описание фото</label>--%>
                                <%--<input type="text" id="backCard"/>--%>
                                <%--<input type="date"/>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--<%--%>
                    <%--}--%>
                <%--%>--%>


                <%--</div>--%>
                <%--<div class="row">--%>
                    <%--<div class="removeButton">--%>
                       <%--удалить--%>
                    <%--</div>--%>
                <%--</div>--%>
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
               <%--url: '/remove_from_gallery',--%>
               <%--data: data,--%>
               <%--success: function(data){--%>
<%--//                   window.location.href="/admin/gallery"--%>
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
