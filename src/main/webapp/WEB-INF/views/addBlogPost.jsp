<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="/resources/css/horse_clubs.css">
        <link rel="stylesheet" href="/resources/css/mainsheet.css">
        <link rel="stylesheet" href="/resources/css/fontawesome.css">
        <script src="/resources/js/jquery.js"></script>
        <script src="/resources/js/ckeditor/ckeditor.js"></script>
        <script src="/resources/js/mainPage.js"></script>
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
                               n. <ul class="transition">
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
                            <div class="mainBlock">
                            <h3 class="blockTitle">Добавление в продажу</h3>
                            <div class="logoSmall">
                                <img src="/WEB-INF/ckfinder/cartSmall3.png" alt="">
                            </div>
                            <form>
                                <label for="title">Файл:</label>
                                <input type="text" id="title" name="title" placeholder="Название"> 
                                <input type="file" id="title"> 
                                <textarea name="editor1" id="editor1" rows="10" cols="80">
                                    Описание
                                </textarea>
                                <button type="submit">Submit epta</button>
                            </form>

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
     <script>
                $(document).ready(function(){
                    CKEDITOR.replace( 'editor1', {
    extraPlugins: 'image2'
} )
                });
            </script>
</html>