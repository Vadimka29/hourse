<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckfinder" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/resources/css/horse_clubs.css">
        <link rel="stylesheet" href="/resources/css/mainsheet.css">
        <link rel="stylesheet" href="/resources/css/fontawesome.css">
        <link rel="stylesheet" href="/resources/css/addOrder.css">
        <script src="/resources/js/jquery.js"></script>
        <script src="/resources/js/mainPage.js"></script>
        <script src="/resources/js/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="page-wrapper">
                <div class="row headerWrapper">
                    <div class="header">
                        <div class="cols col-8 centered">
                            <div class="cols col-6">Добро пожаловать в Федерацию конного спорта Полтавы</div>
                            <div class="cols col-6">
                                <div>
                                    <i class="fa fa-map-marker"></i>г.Полтава, Толстого 12
                                </div>
                                <div>
                                    <i class="fa fa-phone"></i> 8 800 888 88 88
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="cols col-8 centered">
                        <div class="logoWrapper">
                                <img src="/resources/img/logoFull.png" alt="">
                                <div class="border"></div>
                        </div>
                        <div class="menuWrapper">
                        <ul>
                            <li class="transition"><a href="/" class="transition">федерация</a>
                                <ul class="transition">
                                    <li><a href="#">О федерации</a></li>
                                    <li><a href="#">Спонсоры</a></li>
                                    <li><a href="#">Контакты</a></li>
                                </ul>
                            </li>
                            <li class="transition"><a href="/blog" class="transition">блог</a></li>
                            <li class="transition"><a href="/clubs" class="transition">конные клубы</a></li>
                            <li class="transition"><a href="/gallery" class="transition">галерея</a></li>
                            <li class="transition"><a href="/sale" class="transition">продажа</a></li>
                        </ul>
                        </div>
                    </div>
                </div>  
                <div class="row mainBlockWrapper">
                    <div class="cols col-8 centered">
                            <div class="mainBlock addOrder">
                            <h3 class="blockTitle">Добавление в продажу</h3>
                            <div class="logoSmall">
                                <img src="/WEB-INF/ckfinder/cartSmall3.png" alt="">
                            </div>
                            <div class="row">
                                <form method="post" action="" id="addSaleForm">
                                    <div class="cols col-12">
                                        <h3 class="title">Загрузите аватар</h3>
                                        <div class="cols col-12">
                                    <div class="file_upload">
                                                <button type="button">Выбрать фотографию</button>
                                                <input type="file" id="saleItemPhoto" name="saleItemPhoto">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cols col-12">
                                        <h3 class="title">Заполните заголовок</h3>
                                        <textarea id="saleItemTitle" name="saleItemTitle">Заголовок</textarea>
                                    </div>


                                    <div class="cols col-12">
                                        <h3 class="title">Заполните описание</h3>

                                        <textarea id="editor1" name="editor1" rows="10" cols="80"></textarea>
                                        <ckfinder:setupCKEditor basePath="/resources/ckfinder"></ckfinder:setupCKEditor>
                                        <ckeditor:replace replace="editor1" basePath="/resources/js/ckeditor"/>

                                        <div id="addOrder" class="submit">Добавить объявление</div>
                                    </div>
                                </form>
                            </div>
                            </div>

                            </div>
                    </div>
                </div>          
            </div>

            

           <div class="footer">
                <div class="cols col-8 centered">
                    <div class="cols col-7">
                        2014-2015, Федерация конного спорта Полтавы. All Rights Reserved
                    </div>
                    <div class="cols col-5"><a class="registrationLink" href="/authorization">Войти / Зарегистрироваться</a><i class="fa fa-envelope"></i> info@gmail.com</div>
                </div>
            </div>
        </div>
    </body>
    <%--<script>--%>
        <%--$(document).ready(function(){--%>
            <%--CKEDITOR.replace( 'editor1', {--%>
                <%--extraPlugins: 'image2,video',--%>
                <%--extraAllowedContent: 'video[*]{*};source[*]{*}',--%>
                <%--skin : 'icy_orange',--%>
                <%--filebrowserBrowseUrl: '/resources/ckfinder/',--%>
                <%--filebrowserWindowWidth: '860',--%>
                <%--filebrowserWindowHeight: '660'--%>
            <%--} )--%>
        <%--});--%>
    <%--</script>--%>
</html>