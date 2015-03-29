$('document').ready(function(){
    var languages_array = localStorage.getItem('languages_array') || ["ukr","rus","eng"];
    if (typeof(languages_array) == "string")
        languages_array= languages_array.split(",");
    localStorage.setItem('temp_language', languages_array[0]);
    var tempLanguage = localStorage.getItem('temp_language');



    function render(input){
        function _(str, locale) {
            locale = locale || _.defaultLocale;
            if (_.data.hasOwnProperty(locale) && typeof _.data[locale] == 'object') {
                if (_.data[locale].hasOwnProperty(str)) {
                    return _.data[locale][str];
                }
            }
            return str;
        }

        _.defaultLocale = input;
        _.data = {
            input: {}
        };

        _.registerLocale = function registerLocale(locale, data) {
            if (!_.data.hasOwnProperty(locale)) {
                _.data[locale] = {};
            }
            for (var str in data) {
                if (data.hasOwnProperty(str)) {
                    _.data[locale][str] = data[str];
                }
            }
        }


        _.registerLocale('rus', {
            'language_sign':'RUS',
            'hello_text':'Добро пожаловать',
            'logo_src':'/resources/img/logoFull.png',
            'add_button':'Добавить',
            'read_more_button':'Подробнее',
            'single_page_title': 'Запись',
            'register_button_login':'Войти',
            'register_button_register':'Зарегистрироваться',

            'header_hello': 'Добро пожаловать в Федерацию конного спорта Полтавы',
            'header_location': 'г.Полтава, Толстого 12',

            'menu_federation': 'Федерация',
            'menu_federation_about': 'О федерации',
            'menu_federation_sponsors': 'Спонсоры',
            'menu_federation_contacts': 'Контакты',
            'menu_federation_leaders': 'Официальные лица',
            'menu_clubs': 'Конные клубы',
            'menu_blog': 'Блог',
            'menu_gallery': 'Галерея',
            'menu_sale': 'Продажа',
            'menu_sale_horses': 'Лошади',
            'menu_sale_transport': 'Транспорт',
            'menu_sale_ammunition': 'Амуниция',
            'menu_sale_various': 'Разное',

            'menu_events':'События',
            'menu_events_calendar':'Календарь',
            'menu_events_competitions':'Соревнования',
            'menu_events_results':'Результаты',
            'menu_events_seminars':'Семинары',


            'footer_copyright': '2014-2015, Федерация конного спорта Полтавы. All Rights Reserved',
            'footer_register': 'Войти/Зарегистрироваться',
            'footer_email': 'info@gmail.com',

            'blog_title':'Блог',
            'clubs_title':'Конные клубы',
            'gallery_title':'Галерея',
            'sale_title':'Продажа',
            'register_title':'Регистрация / Авторизация',
            'sale_new_title':'Добавление в Продажу',
            'sale_title__add_order':'[ Добавить объявление ]',

            'register_login':'Логин',
            'register_password':'Пароль',
            'register_double_password':'Повторите пароль',
            'register_name':'Имя',
            'register_phone':'Телефон',
            'register_email':'E-mail',


            'add_order__order_title':'Заголовок',
            'add_order__order_category':'Категория',
            'add_order__order_category__horses':'Лошади',
            'add_order__order_category__transport':'Транспорт',
            'add_order__order_category__ammunition':'Амуниция',
            'add_order__order_category__various':'Разное',
            'add_order__order_description':'Описание'
        });

        _.registerLocale('ukr', {
            'language_sign':'UKR',
            'hello_text':'Вітаємо',
            'logo_src':'/resources/img/logoFull.png',
            'add_button':'Додати',
            'read_more_button':'Докладніше',
            'single_page_title': 'Запис',
            'register_button_login':'Увійти',
            'register_button_register':'Зареєструватися',


            'header_hello': 'Вас вітає Федерація кінного спорту Полтави',
            'header_location': 'м.Полтава, Толстого 12',

            'menu_federation': 'Федерація',
            'menu_federation_about': 'Про федерацію',
            'menu_federation_sponsors': 'Спонсори',
            'menu_federation_contacts': 'Контакти',
            'menu_federation_leaders': 'Офіційні представники',
            'menu_clubs': 'Кінні клуби',
            'menu_blog': 'Блог',
            'menu_gallery': 'Галерея',
            'menu_sale': 'Продаж',
            'menu_sale_horses': 'Коні',
            'menu_sale_transport': 'Транспорт',
            'menu_sale_ammunition': 'Амуніція',
            'menu_sale_various': 'Різне',

            'menu_events':'Календар подій',
            'menu_events_calendar':'Календар',
            'menu_events_competitions':'Змагання',
            'menu_events_results':'Результати',
            'menu_events_seminars':'Семінари',


            'footer_copyright': '2014-2015, Федерація кінного спорту Полтави. All Rights Reserved',
            'footer_register': 'Увійти/Зареєструватися',
            'footer_email': 'info@gmail.com',


            'blog_title':'Блог',
            'clubs_title':'Кінні клуби',
            'gallery_title':'Галерея',
            'sale_title':'Продаж',
            'register_title':'Реєстрація / Авторизація',
            'sale_new_title':'Додавання до продажу',
            'sale_title__add_order':'[ Додати оголошення ]',

            'register_login':'Логін',
            'register_password':'Пароль',
            'register_double_password':'Повторіть пароль',
            'register_name':'Ім’я',
            'register_phone':'Телефон',
            'register_email':'E-mail',


            'add_order__order_title':'Зголовок',
            'add_order__order_category':'Категорія',
            'add_order__order_category__horses':'Коні',
            'add_order__order_category__transport':'Транспорт',
            'add_order__order_category__ammunition':'Амуніція',
            'add_order__order_category__various':'Різне',
            'add_order__order_description':'Опис'
        });

        _.registerLocale('eng', {
            'language_sign':'ENG',
            'hello_text':'Welcome',
            'logo_src':'/resources/img/logoFull.png',
            'add_button':'Add',
            'read_more_button':'Read more',
            'single_page_title': 'Record',
            'register_button_login':'Sign in',
            'register_button_register':'Sign up',


            'header_hello': 'Welcome to the Poltava sport horse Federation',
            'header_location': 'Poltava c., Tolstogo 12',

            'menu_federation': 'Federation',
            'menu_federation_about': 'About',
            'menu_federation_sponsors': 'Sponsors',
            'menu_federation_contacts': 'Contacts',
            'menu_federation_leaders': 'Leaders',
            'menu_clubs': 'Horse clubs',
            'menu_blog': 'Blog',
            'menu_gallery': 'Gallery',
            'menu_sale': 'Selling',
            'menu_sale_horses': 'Horses',
            'menu_sale_transport': 'Transport',
            'menu_sale_ammunition': 'Ammunition',
            'menu_sale_various': 'Various',

            'menu_events':'Occasions',
            'menu_events_calendar':'Calendar',
            'menu_events_competitions':'Championships',
            'menu_events_results':'Results',
            'menu_events_seminars':'Seminars',

            'footer_copyright': '2014-2015, Poltava sport horse Federation. All Rights Reserved',
            'footer_register': 'Sign in/Sign up',
            'footer_email': 'info@gmail.com',

            'blog_title':'Blog',
            'clubs_title':'Horse clubs',
            'gallery_title':'Gallery',
            'sale_title':'Selling',
            'register_title':'Sign in / Sign up',
            'sale_new_title':'Adding sale',
            'sale_title__add_order':'[ Add order ]',


            'register_login':'Login',
            'register_password':'Password',
            'register_double_password':'Repeat password',
            'register_name':'Name',
            'register_phone':'Phone',
            'register_email':'E-mail',

            'add_order__order_title':'Title',
            'add_order__order_category':'Category',
            'add_order__order_category__horses':'Horses',
            'add_order__order_category__transport':'Transport',
            'add_order__order_category__ammunition':'Ammunition',
            'add_order__order_category__various':'Various',
            'add_order__order_description':'Description'
        });

        $('.locale').each(function(){
            if ( $(this)[0].tagName == "IMG"){
                $(this).attr('src',_(this.dataset.name));
            }else {
                $(this).text(_(this.dataset.name))
            }
        });

    }
    render(tempLanguage);


    $('.localeButton').click(function(){
        var buf = languages_array.shift();
        languages_array.push(buf);
        localStorage.setItem('languages_array', languages_array);
        localStorage.setItem('temp_language', languages_array[0]);
        var tempLanguage = localStorage.getItem('temp_language');
        render(tempLanguage);
    });
});