<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <title>Регистрация | Федерация конного спорта Полтавы</title>
		<link rel="stylesheet" href="/resources/css/horse_clubs.css">
		<link rel="stylesheet" href="/resources/css/mainsheet.css">
		<link rel="stylesheet" href="/resources/css/fontawesome.css">
		<script src="/resources/js/jquery.js"></script>
        <script src="/resources/js/locale.js"></script>
		<script src="/resources/js/mainPage.js"></script>
		<script src="/resources/js/autorization.js"></script>
        <script src="/resources/js/adaptive.js"></script>

	</head>
	<body>
		<div class="container">
			<div class="page-wrapper">
                <jsp:include page="header.jsp"/>
				<div class="row mainBlockWrapper">
					<div class="cols col-8 centered">
							<div class="mainBlock register">
							<h3 class="blockTitle"><span class="locale" data-name="register_title"></span></h3>
							<div class="logoSmall">
								<img src="/resources/img/newUser.png" alt="">
							</div>
								<div class="row loginAction">
									<h3 class="title"><span class="locale" data-name="register_login"></span></h3>
									<input type="text" id="loginActionLogin">
										<h3 class="title"><span class="locale" data-name="register_password"></span></h3>
									<input type="password" id="loginActionPassword">
									<div class="submit loginAction transition" onclick="window.location.href='/'"><span class="locale" data-name="register_button_login"></span></div>
								</div>

								<div class="row registerAction">

									<h3 class="title"><span class="locale" data-name="register_name"></span></h3>
								<input type="text" id="registerActionName">
									<h3 class="title"><span class="locale" data-name="register_phone"></span></h3>
								<input type="text" id="registerActionPhoneNumber">
									<h3 class="title"><span class="locale" data-name="register_email"></span></h3>
								<input type="text" id="registerActionEmail">
									<h3 class="title"><span class="locale" data-name="register_login"></span></h3>
								<input type="text" id="registerActionLogin">
									<h3 class="title"><span class="locale" data-name="register_password"></span></h3>
								<input type="password" id="registerActionPassword">
                                    <h3 class="title"><span class="locale" data-name="register_double_password"></span></h3>
                                <input type="password" id="registerActionPassword2">
									<div class="submit registerAction transition" onclick="window.location.href='/'"><span class="locale" data-name="register_button_register"></span></div>
								</div>
							</div>
					</div>
				</div>			
			</div>



            <jsp:include page="footer.jsp"/>
		</div>
	</body>
</html>