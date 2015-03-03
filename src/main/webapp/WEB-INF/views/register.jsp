<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="/resources/css/horse_clubs.css">
		<link rel="stylesheet" href="/resources/css/mainsheet.css">
		<link rel="stylesheet" href="/resources/css/fontawesome.css">
		<script src="/resources/js/jquery.js"></script>
		<script src="/resources/js/mainPage.js"></script>
		<script src="/resources/js/autorization.js"></script>

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
                            <li class="transition"><a href="index.jsp" class="transition">федерация</a>
                                <ul class="transition">
                                    <li><a href="#">О федерации</a></li>
                                    <li><a href="#">Спонсоры</a></li>
                                    <li><a href="#">Контакты</a></li>
                                </ul>
                            </li>
                            <li class="transition"><a href="blog.html" class="transition">блог</a></li>
                            <li class="transition"><a href="clubs.jsp" class="transition">конные клубы</a></li>
                            <li class="transition"><a href="galery.jsp" class="transition">галерея</a></li>
                            <li class="transition"><a href="sale.jsp" class="transition">продажа</a></li>
                        </ul>
                        </div>
					</div>
				</div>	
				<div class="row mainBlockWrapper">
					<div class="cols col-8 centered">
							<div class="mainBlock register">
							<h3 class="blockTitle">регистрация / авторизация</h3>
							<div class="logoSmall">
								<img src="/resources/img/newUser.png" alt="">
							</div>
								<div class="row loginAction">
									<h3 class="title">Логин</h3>
									<input type="text" id="loginActionLogin">
										<h3 class="title">Пароль</h3>
									<input type="text" id="loginActionPassword">
									<div class="submit loginAction">Войти</div>
								</div>

								<div class="row registerAction">

									<h3 class="title">Имя</h3>
								<input type="text" id="registerActionName">
									<h3 class="title">Телефон</h3>
								<input type="text" id="registerActionPhoneNummber">
									<h3 class="title">E-mail</h3>
								<input type="text" id="registerActionEmail">
									<h3 class="title">Логин</h3>
								<input type="text" id="registerActionLogin">
									<h3 class="title">Пароль</h3>
								<input type="text" id="registerActionPassword">
									<div class="submit registerAction">Зарегистрироваться</div>
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
					<div class="cols col-5"><a class="registrationLink" href="register.jsp">Войти / Зарегистрироваться</a><i class="fa fa-envelope"></i> info@gmail.com</div>
				</div>
			</div>
		</div>
	</body>
</html>