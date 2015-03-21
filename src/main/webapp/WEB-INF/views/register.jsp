<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="/resources/css/horse_clubs.css">
		<link rel="stylesheet" href="/resources/css/mainsheet.css">
		<link rel="stylesheet" href="/resources/css/fontawesome.css">
		<script src="/resources/js/jquery.js"></script>
        <script src="/resources/js/locale.js"></script>
		<script src="/resources/js/mainPage.js"></script>
		<script src="/resources/js/autorization.js"></script>

	</head>
	<body>
		<div class="container">
			<div class="page-wrapper">
                <jsp:include page="header.jsp"/>
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
									<input type="password" id="loginActionPassword">
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
								<input type="password" id="registerActionPassword">
                                    <h3 class="title">Повторите пароль</h3>
                                <input type="password" id="registerActionPassword2">
									<div class="submit registerAction">Зарегистрироваться</div>
								</div>
							</div>
					</div>
				</div>			
			</div>



            <jsp:include page="footer.jsp"/>
		</div>
	</body>
</html>