$('document').ready(function(){
    var languages_array = localStorage.getItem('languages_array') || ["rus","ukr","eng"];
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
            'logo_src':'/resources/img/logoFull.png',
            'add_button':'Добавить',

            'header_hello': 'Добро пожаловать в Федерацию конного спорта Полтавы',
            'header_location': 'г.Полтава, Толстого 12',

            'menu_federation': 'Федерация',
            'menu_federation_about': 'О федерации',
            'menu_federation_sponsors': 'Спонсоры',
            'menu_federation_contacts': 'Контакты',
            'menu_clubs': 'Конные клубы',
            'menu_blog': 'Блог',
            'menu_gallery': 'Галерея',
            'menu_sale': 'Продажа',
            'menu_sale_horses': 'Лошади',
            'menu_sale_transport': 'Транспорт',
            'menu_sale_ammunition': 'Амуниция',
            'menu_sale_various': 'Разное',

            'footer_copyright': '2014-2015, Федерация конного спорта Полтавы. All Rights Reserved',
            'footer_register': 'Войти/Зарегистрироваться',
            'footer_email': 'info@gmail.com',

            'blog_title':'Блог',
            'clubs_title':'Конные клубы',
            'gallery_title':'Галерея',
            'sale_title':'Продажа',
            'sale_new_title':'Добавление в Продажу',
            'sale_title__add_order':'[ Добавить объявление ]',

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
            'logo_src':'/resources/img/logo_small_ukr.png',
            'add_button':'Додати',


            'header_hello': 'Вас вітає Федерація кінного спорту Полтави',
            'header_location': 'м.Полтава, Толстого 12',

            'menu_federation': 'Федерація',
            'menu_federation_about': 'Про федерацію',
            'menu_federation_sponsors': 'Спонсори',
            'menu_federation_contacts': 'Контакти',
            'menu_clubs': 'Кінні клуби',
            'menu_blog': 'Блог',
            'menu_gallery': 'Галерея',
            'menu_sale': 'Продаж',
            'menu_sale_horses': 'Коні',
            'menu_sale_transport': 'Транспорт',
            'menu_sale_ammunition': 'Амуніція',
            'menu_sale_various': 'Різне',

            'footer_copyright': '2014-2015, Федерація кінного спорту Полтави. All Rights Reserved',
            'footer_register': 'Увійти/Зареєструватися',
            'footer_email': 'info@gmail.com',


            'blog_title':'Блог',
            'clubs_title':'Кінні клуби',
            'gallery_title':'Галерея',
            'sale_title':'Продаж',
            'sale_new_title':'Додавання до продажу',
            'sale_title__add_order':'[ Додати оголошення ]',

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
            'logo_src':'/resources/img/logo_small_eng.png',
            'add_button':'Add',


            'header_hello': 'Welcome to the Poltava sport horse Federation',
            'header_location': 'Poltava c., Tolstogo 12',

            'menu_federation': 'Federation',
            'menu_federation_about': 'About',
            'menu_federation_sponsors': 'Sponsors',
            'menu_federation_contacts': 'Contacts',
            'menu_clubs': 'Horse clubs',
            'menu_blog': 'Blog',
            'menu_gallery': 'Gallery',
            'menu_sale': 'Selling',
            'menu_sale_horses': 'Horses',
            'menu_sale_transport': 'Transport',
            'menu_sale_ammunition': 'Ammunition',
            'menu_sale_various': 'Various',

            'footer_copyright': '2014-2015, Poltava sport horse Federation. All Rights Reserved',
            'footer_register': 'Sign in/Sign up',
            'footer_email': 'info@gmail.com',

            'blog_title':'Blog',
            'clubs_title':'Horse clubs',
            'gallery_title':'Gallery',
            'sale_title':'Selling',
            'sale_new_title':'Adding sale',
            'sale_title__add_order':'[ Add order ]',

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