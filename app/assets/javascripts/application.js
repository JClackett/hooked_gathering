// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Show/Hide Topbar nav using bars
------------------------------------------------------------------------------------------------------------------------------------------------------ */
$(document).on('ready page:load', function () {
    $(".topbar__menu").click(function(e) {
        $(".nav").toggle();
        if ($(".topbar__menu").hasClass("fa-hand-peace-o")) {
            $(".topbar__menu").removeClass("fa-hand-peace-o");
            $(".topbar__menu").addClass("fa-hand-scissors-o");
         } else {
            $(".topbar__menu").addClass("fa-hand-peace-o");
            $(".topbar__menu").removeClass("fa-hand-scissors-o");
         }
        e.stopPropagation();
    });

    $(document).click(function(e) {
        if (!$(e.target).is('.nav, .nav*')) {
            $(".nav").hide();
            $(".topbar__menu").addClass("fa-hand-peace-o");
            $(".topbar__menu").removeClass("fa-hand-scissors-o");
        }
    });
});


/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Nav Scroll Function
------------------------------------------------------------------------------------------------------------------------------------------------------ */
$(document).on('ready page:load', function () {
      $(".home-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#home").offset().top},
            2000,'easeOutQuart')
        });

      $(".news-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#news").offset().top},
            2000,'easeOutQuart')
        });

      $(".lineup-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#lineup").offset().top},
            2000,'easeOutQuart')
        });

      $(".info-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#info").offset().top},
            2000,'easeOutQuart')
        });

      $(".ticket-link").click(function() {
        $('html,body').animate({
            scrollTop: $("#tickets").offset().top},
            2000,'easeOutQuart')
        });
});



/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Slider Initialize
------------------------------------------------------------------------------------------------------------------------------------------------------ */
jQuery(function($) {
    $('.slider').sss();
});



/* ------------------------------------------------------------------------------------------------------------------------------------------------------
   Cover JS
------------------------------------------------------------------------------------------------------------------------------------------------------ */
$(document).on('ready page:load', function () {

    scaleVideoContainer();

    initBannerVideoSize('.video-container .poster img');
    initBannerVideoSize('.video-container .filter');
    initBannerVideoSize('.video-container video');

    $(window).on('resize', function() {
        scaleVideoContainer();
        scaleBannerVideoSize('.video-container .poster img');
        scaleBannerVideoSize('.video-container .filter');
        scaleBannerVideoSize('.video-container video');
    });

});

function scaleVideoContainer() {

    var height = $(window).height() + 5;
    var unitHeight = parseInt(height) + 'px';
    $('.homepage-hero-module').css('height',unitHeight);
    $('.homepage-hero-module').css('z-index',-1);

}

function initBannerVideoSize(element){

    $(element).each(function(){
        $(this).data('height', $(this).height());
        $(this).data('width', $(this).width());
    });

    scaleBannerVideoSize(element);

}

function scaleBannerVideoSize(element){

    var windowWidth = $(window).width(),
    windowHeight = $(window).height() + 70,
    videoWidth,
    videoHeight;

    $(element).each(function(){
        var videoAspectRatio = $(this).data('height')/$(this).data('width'),
        windowAspectRatio = windowHeight/windowWidth;

        if(windowAspectRatio > 0.57){
            $(this).height(windowHeight);
        }

        else {
            $(this).width(windowWidth);
        }

        $(this).addClass('fadeIn animated');

    });
}