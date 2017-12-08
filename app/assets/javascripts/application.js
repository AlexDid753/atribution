// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require_tree .
// $(function () {
//     $("[type=radio],.pagination a").live("click", function () {
//         $("#statistics_table").html("<%= escape_javascript(render 'layouts/statistics_table' )) %>");
//     });
//     $("#statistics_search input").keyup(function () {
//         $.get($("#statistics_search").attr("action"), $("#statistics_search").serialize(), null, "script");
//         return false;
//     });
// });
// $(function () {
//
//     $('#statistics_search')[0].reset();
// });



$('#who_win_first').click(function () {
    $('#who_win_linear').append('<p>Меня тут не было!</p>');

    localStorage.setItem('who_win_first', checked);
});

$('#who_win_last').click(function () {

    localStorage.setItem('who_win_last', checked);
});

$('#who_win_linear').click(function () {

    localStorage.setItem('who_win_linear', checked);
});

 $('#who_win_first').prop('checked', localStorage['who_win_first'] == 'true');
 $('#who_win_last').prop('checked', localStorage['who_win_last'] == 'true');
 $('#who_win_linear').prop('checked', localStorage['who_win_linear'] == 'true');

$(document).ready(function(){

    $(".b-carousel-button-right").click(function(){ // при клике на правую кнопку запускаем следующую функцию:
        var current_slider = $(this).closest(".b-carousel");// ПОЛУЧАЕМ ТЕКУЩИЙ СЛАЙДЕР ЧТОБЫ ИСПОЛЬЗОВАТЬ ЕГО В setTimeout
        var currrent_carousel_items = current_slider.find(".h-carousel-items");
        currrent_carousel_items.animate({left: "-222px"}, 200); // производим анимацию: блок с набором картинок уедет влево на 222 пикселя (это ширина одного прокручиваемого элемента) за 200 милисекунд.
        setTimeout(function () { // устанавливаем задержку времени перед выполнением следующих функций. Задержка нужна, т.к. эти ффункции должны запуститься только после завершения анимации.
            var first_el = current_slider.find(".b-carousel-block").eq(0).clone(); // выбираем первый элемент, создаём его копию
            currrent_carousel_items.append(first_el);// и помещаем в конец карусели
            current_slider.find(".b-carousel-block").eq(0).remove(); // удаляем первый элемент карусели
            currrent_carousel_items.css({"left":"0px"}); // возвращаем исходное смещение набора набора элементов карусели
        }, 300);
    });

    $(".b-carousel-button-left").click(function(){ // при клике на левую кнопку выполняем следующую функцию:
        var current_slider = $(this).closest(".b-carousel");// ПОЛУЧАЕМ ТЕКУЩИЙ СЛАЙДЕР ЧТОБЫ ИСПОЛЬЗОВАТЬ ЕГО В setTimeout
        var currrent_carousel_items = current_slider.find(".h-carousel-items");
        current_slider.find(".b-carousel-block").eq(-1).clone(); // выбираем последний элемент набора, создаём его копию

        var end_el = current_slider.find(".b-carousel-block").eq(-1).clone();
        currrent_carousel_items.prepend(end_el);// и помещаем в начало карусели
        current_slider.find(".h-carousel-items").css({"left":"-222px"}); // устанавливаем смещение набора -222px
        current_slider.find(".h-carousel-items").animate({left: "0px"}, 200); // за 200 милисекунд набор элементов плавно переместится в исходную нулевую точку
        current_slider.find(".b-carousel-block").eq(-1).remove(); // выбираем последний элемент карусели и удаляем его
    });


});