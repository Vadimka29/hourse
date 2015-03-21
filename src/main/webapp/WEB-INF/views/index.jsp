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
        <script src="/resources/js/locale.js"></script>

	    <!-- // Flickerplate -->
	    <script src="/resources/js/Flickerplate/js/flickerplate.js"></script>
	    <link href="/resources/js/Flickerplate/css/flickerplate.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="container indexPage">
			<div class="page-wrapper">
					<div class="row">
					<div class="header">
						<div class="cols col-8 centered">
							<div class="cols col-6 locale" data-name='header_hello'></div>
							<div class="cols col-6">
								<div>
									<i class="fa fa-map-marker"></i><span class="locale" data-name='header_location'></span>
								</div>
								<div>
									<i class="fa fa-phone"></i> 8 800 888 88 88
								</div>
                                <div class="localeButton">
                                    <span class="locale" data-name="language_sign"></span>
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
                            <li class="transition"><a href="/" class="transition"><span class="locale" data-name="menu_federation"></span></a>
                                <ul class="transition">
                                    <li><a href="#"><span class="locale" data-name="menu_federation_about"></span></a></li>
                                    <li><a href="#"><span class="locale" data-name="menu_federation_sponsors"></span></a></li>
                                    <li><a href="#"><span class="locale" data-name="menu_federation_contacts"></span></a></li>
                                </ul>
                            </li>
                            <li class="transition"><a href="/blog" class="transition"><span class="locale" data-name="menu_blog"></span></a></li>
                            <li class="transition"><a href="/clubs" class="transition"><span class="locale" data-name="menu_clubs"></span></a></li>
                            <li class="transition"><a href="/gallery" class="transition"><span class="locale" data-name="menu_gallery"></span></a></li>
                            <li class="transition"><a href="/sale" class="transition"><span class="locale" data-name="menu_sale"></span></a>
                                <ul>
                                    <li class="transition"><a href="" class="transition"><span class="locale" data-name="menu_sale_horses"></span></a></li>
                                    <li class="transition"><a href="" class="transition"><span class="locale" data-name="menu_sale_transport"></span></a></li>
                                    <li class="transition"><a href="" class="transition"><span class="locale" data-name="menu_sale_ammunition"></span></a></li>
                                    <li class="transition"><a href="" class="transition"><span class="locale" data-name="menu_sale_various"></span></a></li>
                                </ul>
                            </li>
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
            <jsp:include page="footer.jsp"/>
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