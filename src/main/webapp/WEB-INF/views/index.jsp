<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="/resources/css/indexPage.css">
		<link rel="stylesheet" href="/resources/css/mainsheet.css">
		<link rel="stylesheet" href="/resources/css/fontawesome.css">
		<script src="/resources/js/jquery.js"></script>
		<script src="/resources/js/mainPage.js"></script>
		<script src="/resources/js/popup.js"></script>


		<script src="/resources/js/Flickerplate/js/min/jquery-v1.10.2.min.js"></script>
	    <script src="/resources/js/Flickerplate/js/min/modernizr-custom-v2.7.1.min.js"></script>
	    <script src="/resources/js/Flickerplate/js/min/hammer-v2.0.3.min.js"></script>
		
	    <!-- // Flickerplate -->
	    <script src="/resources/js/Flickerplate/js/flickerplate.js"></script>
	    <link href="/resources/css/flickerplate.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="container indexPage">
			<div class="page-wrapper">
					<div class="row">
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
						<div class="slider">
							<div class="arrow left arrow-navigation left">
								<div class="transition"><i class="fa fa-angle-left left transition"></i></div>
							</div>
							<div class="arrow right arrow-navigation right">
								<div class="transition"><i class="fa fa-angle-right transition"></i></div>
							</div>	

							<div class="flicker-example ">	
							    <ul>
							        <li data-background="/resources/img/slider/slide1.jpg" style="background:url('/resources/img/slider/slide1.jpg'); background-size:cover;">
							          
							        </li>
							        <li data-background="/resources/img/slider/slide2.jpg" style="background:url('/resources/img/slider/slide1.jpg'); background-size:cover;">
							        </li> 
							          <li data-background="/resources/img/slider/slide5.jpg" style="background:url('/resources/img/slider/slide1.jpg'); background-size:cover;">
							        </li>
							        <li data-background="/resources/img/slider/slide6.jpg" style="background:url('/resources/img/slider/slide1.jpg'); background-size:cover;">
							        </li> 
							    </ul>
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
					<div class="cols col-5"><a class="registrationLink" href="/register">Войти / Зарегистрироваться</a><i class="fa fa-envelope"></i> info@gmail.com</div>
				</div>
			</div>
		</div>
	</body>
<script>
$(document).ready(function()
{
    $('.flicker-example').flickerplate(
    {
        arrows: true,
        arrows_constraint: false,
        auto_flick: true,
        auto_flick_delay: 10,
        block_text: true,
        dot_alignment: 'center',
        dot_navigation: false,
        flick_animation: 'jquery-fade',
        flick_position: 1,
        theme: 'light'
    });
});
</script>
</html>