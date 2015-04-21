<div class="row headerWrapper">
    <div class="header">
        <link href='http://fonts.googleapis.com/css?family=Exo+2:400,500italic,100,300,500,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
        <div class="cols col-8 centered">
            <div class="cols col-5 locale" data-name='header_hello'></div>
            <div class="cols col-7">
                <div class="pointer helloMsg"
                     <%--onclick="window.location.href='/contacts'"--%>
                        >

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
            <img src="" alt="" class="locale" data-name="logo_src" onclick="location.href=window.location.href='/'">
            <div class="border"></div>
        </div>

        <div class="menuWrapper">
            <div class="row showSubMenu">
                <div class="cols col-12" onclick="showSubMenu()"><span class="locale" data-name="hello_text"></span><i class="fa fa-bars showSubMenuButton"></i></div>
            </div>
            <ul>

                <li class="transition"><a href="/" class="transition"><span class="locale" data-name="menu_federation"></span></a>
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
                        <li class="transition"><a href="/sale/horses/1" class="transition"><span class="locale" data-name="menu_sale_horses"></span></a></li>
                        <li class="transition"><a href="/sale/transport/1" class="transition"><span class="locale" data-name="menu_sale_transport"></span></a></li>
                        <li class="transition"><a href="/sale/ammunition/1" class="transition"><span class="locale" data-name="menu_sale_ammunition"></span></a></li>
                        <li class="transition"><a href="/sale/etc/1" class="transition"><span class="locale" data-name="menu_sale_various"></span></a></li>
                    </ul>
                </li>

                <li class="transition"><a class="transition"><span class="locale" data-name="menu_events"></span></a>
                    <ul>
                        <li class="transition"><a href="/calendar" class="transition"><span class="locale" data-name="menu_events_calendar"></span></a></li>
                        <li class="transition"><a href="/championships" class="transition"><span class="locale" data-name="menu_events_competitions"></span></a></li>
                        <li class="transition"><a href="/results" class="transition"><span class="locale" data-name="menu_events_results"></span></a></li>
                        <li class="transition"><a href="/seminars" class="transition"><span class="locale" data-name="menu_events_seminars"></span></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
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
                <li class="transition"><a href="/calendar" class="transition"><span class="locale" data-name="menu_events_calendar"></span></a></li>
                <li class="transition"><a href="/championships" class="transition"><span class="locale" data-name="menu_events_competitions"></span></a></li>
                <li class="transition"><a href="/results" class="transition"><span class="locale" data-name="menu_events_results"></span></a></li>
                <li class="transition"><a href="/seminars" class="transition"><span class="locale" data-name="menu_events_seminars"></span></a></li>
            </ul>
        </li>

        <li>
            <div class="localeButton">
                <span class="locale" data-name="language_sign"></span>
            </div>
        </li>
    </ul>
</menu>