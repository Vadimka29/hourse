$(document).ready(function() {
    /* глобальные переменные */
    var event_start = $('#event_start');
    var event_end = $('#event_end');
    var event_type = $('#event_type');
    var calendar = $('#calendar');
    var form = $('#dialog-form');
    var event_id = $('#event_id');
    var format = "MM/dd/yyyy HH:mm";
    var dataEvents = null;

    $.ajax({
        url: "/rest/calendar",
        type: "POST",
        async:false,

        success: function (data) {

            var regex = /([-+0-9]{6,})/g
            var input = JSON.stringify(data);
            var arr;
            var results = [];
            var buf = input;

            var regArray = input.match(regex);
            for (var i=0; i < regArray.length; i++){
                buf = buf.replace(regArray[i].toString(), '"' + convertTimestamp(regArray[i]) + '"');
            }

            function pad (n, len, padding) {
                var sign = '', s = n;
                if (typeof n === 'number') {
                    sign = n < 0 ? '-' : '';
                    s = Math.abs (n).toString ();
                }
                if ((len -= s.length) > 0)
                    s = Array (len + 1).join (padding || '0') + s;
                return sign + s;
            }

            function convertTimestamp(input) {
                var timestampValue = parseInt(input);
                var dt = new Date(timestampValue);
                return  dt.getFullYear() + '-' + pad(dt.getMonth()+1, 2) + '-' + pad(dt.getDate(), 2) + ' ' + pad(dt.getHours(), 2) + ':' + pad(dt.getMinutes(), 2) + ':' + pad(dt.getSeconds(), 2);
            }
            dataEvents = buf.replace(/"type"/g,'"title"');
            console.log(typeof(dataEvents));
        }

    });



    $('#add_event_button').button().click(function(){
        formOpen('add');
    });
    function emptyForm() {
        event_start.val("");
        event_end.val("");
        event_type.val("");
        event_id.val("");
    }
    function formOpen(mode) {
        if(mode == 'add') {
            $('#add').show();
            $('#edit').hide();
            $("#delete").button("option", "disabled", true);
        }
        else if(mode == 'edit') {
            $('#edit').show();
            $('#add').hide();
            $("#delete").button("option", "disabled", false);
        }else if (mode == 'show') {
            $('#edit').hide();
            $('#add').hide();
            $("#delete").hide();
        }
        form.dialog('open');
    }

    calendar.fullCalendar({
        firstDay: 1,
        height: 500,
        editable: true,
        header: {
            left: 'prev,next today',
            center: 'title',
            right: ''
        },
        monthNames: ['Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь'],
        monthNamesShort: ['Янв.','Фев.','Март','Апр.','Май','Июнь','Июль','Авг.','Сент.','Окт.','Ноя.','Дек.'],
        dayNames: ["Воскресенье","Понедельник","Вторник","Среда","Четверг","Пятница","Суббота"],
        dayNamesShort: ["ВС","ПН","ВТ","СР","ЧТ","ПТ","СБ"],
        buttonText: {
            prev: "&nbsp;&#9668;&nbsp;",
            next: "&nbsp;&#9658;&nbsp;",
            prevYear: "&nbsp;&lt;&lt;&nbsp;",
            nextYear: "&nbsp;&gt;&gt;&nbsp;",
            today: "Сегодня",
            month: "Месяц",
            week: "Неделя",
            day: "День"
        },
        /* формат времени выводимый перед названием события*/
        timeFormat: 'H:mm',
        
        eventClick: function(calEvent, jsEvent, view) {
            event_id.val(calEvent.id);
            event_type.val(calEvent.title);
            event_start.val($.fullCalendar.formatDate(calEvent.start, format));
            event_end.val($.fullCalendar.formatDate(calEvent.end, format));
            formOpen('show');
        },

        events:JSON.parse(dataEvents)
    });

    form.dialog({
        autoOpen: false,
        buttons: [{
            id: 'add',
            text: 'Добавить',
            click: function() {
                $.ajax({
                    type: "POST",
                    url: "ajax.php",
                    data: {
                        start: event_start.val(),
                        end: event_end.val(),
                        type: event_type.val(),
                        op: 'add'
                    },
                    success: function(id){
                        calendar.fullCalendar('renderEvent', {
                            id: id,
                            title: event_type.val(),
                            start: event_start.val(),
                            end: event_end.val(),
                            allDay: false
                        });

                    }
                });
                emptyForm();
            }
        },
            {   id: 'edit',
                text: 'Изменить',
                click: function() {
                    $.ajax({
                        type: "POST",
                        url: "ajax.php",
                        data: {
                            id: event_id.val(),
                            start: event_start.val(),
                            end: event_end.val(),
                            type: event_type.val(),
                            op: 'edit'
                        },
                        success: function(id){
                            calendar.fullCalendar('refetchEvents');

                        }
                    });
                    $(this).dialog('close');
                    emptyForm();
                }
            },
            {   id: 'cancel',
                text: 'Отмена',
                click: function() {
                    $(this).dialog('close');
                    emptyForm();
                }
            },
            {   id: 'delete',
                text: 'Удалить',
                click: function() {
                    $.ajax({
                        type: "POST",
                        url: "ajax.php",
                        data: {
                            id: event_id.val(),
                            op: 'delete'
                        },
                        success: function(id){
                            calendar.fullCalendar('removeEvents', id);
                        }
                    });
                    $(this).dialog('close');
                    emptyForm();
                },
                disabled: true
            }]
    });

});
