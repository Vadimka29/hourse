<%@ page import="ua.com.iweb.enteties.SliderEntity" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <title>Федерация конного спорта Полтавы</title>
		<link rel="stylesheet" href="/resources/css/indexPage.css">
		<link rel="stylesheet" href="/resources/css/mainsheet.css">
		<link rel="stylesheet" href="/resources/css/fontawesome.css">
        <link href='http://fonts.googleapis.com/css?family=Exo+2:400,500italic,100,300,500,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>

        <script src="/resources/js/jquery.js"></script>
		<script src="/resources/js/adaptive.js"></script>


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
							<div class="cols col-5 locale" data-name='header_hello'></div>
							<div class="cols col-7 pointer">
								<div onclick="window.location.href='/contacts'">
									<i class="fa fa-map-marker"></i><span class="locale" data-name='header_location'></span>
								</div>
								<%--<div>--%>
									<%--<i class="fa fa-phone"></i> 8 800 888 88 88--%>
								<%--</div>--%>
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
                        <%--Адаптивное меню--%>
                        <menu class="subMenu cols col-12">
                            <%--<div class="cols col-12">--%>
                                <%--<img src="/resources/img/logoFull.png" alt="">--%>
                            <%--</div>--%>
                            <li class="responseMenuClose"><i class="fa fa-remove" onclick="closeSubMenu()"></i></li>
                            <ul>
                                <li class="head transition"><a href="/" class="transition"><span class="locale" data-name="menu_federation"></span></a>
                                    <i class="fa fa-caret-down"></i>
                                    <ul class="transition">
                                        <li><a href="/about"><span class="locale" data-name="menu_federation_about"></span></a></li>
                                        <li><a href="/sponsors"><span class="locale" data-name="menu_federation_sponsors"></span></a></li>
                                        <li><a href="/contacts"><span class="locale" data-name="menu_federation_contacts"></span></a></li>
                                    </ul>
                                </li>
                                <li class=" head transition"><a href="/blog" class="transition"><span class="locale" data-name="menu_blog"></span></a></li>
                                <li class=" headtransition"><a href="/clubs" class="transition"><span class="locale" data-name="menu_clubs"></span></a></li>
                                <li class="head transition"><a href="/gallery" class="transition"><span class="locale" data-name="menu_gallery"></span></a></li>
                                <li class="head transition"><a href="/sale" class="transition"><span class="locale" data-name="menu_sale"></span></a>
                                    <i class="fa fa-caret-down"></i>
                                    <ul class="transition">
                                        <li><a href=""><span class="locale" data-name="menu_sale_horses"></span></a></li>
                                        <li><a href=""><span class="locale" data-name="menu_sale_transport"></span></a></li>
                                        <li><a href=""><span class="locale" data-name="menu_sale_ammunition"></span></a></li>
                                        <li><a href=""><span class="locale" data-name="menu_sale_various"></span></a></li>
                                    </ul>
                                </li>
                                <li class="head transition"><a class="transition"><span class="locale" data-name="menu_events"></span></a>
                                    <i class="fa fa-caret-down"></i>
                                    <ul>
                                        <li class="transition"><a href="/events/calendar" class="transition"><span class="locale" data-name="menu_events_calendar"></span></a></li>
                                        <li class="transition"><a href="/events/competitions" class="transition"><span class="locale" data-name="menu_events_competitions"></span></a></li>
                                        <li class="transition"><a href="/events/results" class="transition"><span class="locale" data-name="menu_events_results"></span></a></li>
                                        <li class="transition"><a href="/events/seminars" class="transition"><span class="locale" data-name="menu_events_seminars"></span></a></li>
                                    </ul>
                                </li>

                                <li>
                                    <div class="localeButton">
                                        <span class="locale" data-name="language_sign"></span>
                                    </div>
                                </li>
                            </ul>
                        </menu>

						<div class="menuWrapper">
                            <div class="row showSubMenu">
                                <div class="cols col-12" onclick="showSubMenu()"><span class="locale" data-name="hello_text"></span><i class="fa fa-bars showSubMenuButton"></i></div>
                            </div>
                        <ul>
                            <li class="">
                                <a href="/" class="transition"><span class="locale" data-name="menu_federation"></span></a>
                                <ul class="transition">
                                    <li><a href="/about"><span class="locale" data-name="menu_federation_about"></span></a></li>
                                    <li><a href="/sponsors"><span class="locale" data-name="menu_federation_sponsors"></span></a></li>
                                    <li><a href="/contacts"><span class="locale" data-name="menu_federation_contacts"></span></a></li>
                                    <li><a href="/leaders"><span class="locale" data-name="menu_federation_leaders"></span></a></li>
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
                            <li class="transition"><a  class="transition"><span class="locale" data-name="menu_events"></span></a>
                                <ul>
                                    <li class="transition"><a href="/events/calendar" class="transition"><span class="locale" data-name="menu_events_calendar"></span></a></li>
                                    <li class="transition"><a href="/events/competitions" class="transition"><span class="locale" data-name="menu_events_competitions"></span></a></li>
                                    <li class="transition"><a href="/events/results" class="transition"><span class="locale" data-name="menu_events_results"></span></a></li>
                                    <li class="transition"><a href="/events/seminars" class="transition"><span class="locale" data-name="menu_events_seminars"></span></a></li>
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
                                    <%
                                        List<SliderEntity> sliderPhotos = (List<SliderEntity>) request.getAttribute("sliderPhotos");
                                        for(SliderEntity entity: sliderPhotos){
                                    %>
                                    <li data-background="/resources/uploads/slider/<%=entity.getDescription()%>" style="background:url('/resources/uploads/slider/<%=entity.getDescription()%>'); background-size:cover;"
                                    </li>
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