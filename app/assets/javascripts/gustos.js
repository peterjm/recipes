/**
 * Scripts
 *
 * -------------------------------------------------------------------------------------
 * Author: Smartik
 * Author URI: http://smartik.ws/
 * Copyright: (c) 2014 Smartik. All rights reserved
 * -------------------------------------------------------------------------------------
 *
 */
;(function( $ ) {

  "use strict";

$(document).ready(function(){

  /* Rw Sidebar
  ------------------------------------------------*/
  $('.rw-sidebar').rw_Sidebar();

  /* Main menus
  ------------------------------------------------*/
  $('#the-main-menu').smk_Menu();
  $('#the-user-menu').smk_Menu({
    responsive: false,
    subMenuMarkText: false
  });

  /* Carousel
  ------------------------------------------------*/
  $(".carousel-posts").owlCarousel({
    items: 3,
    paginationSpeed: 300,
    rewindSpeed: 400
  });
  $('.carousel-posts-nav-prev').on('click', function(){
    $(this).parents('.grid-container').find('.carousel-posts').trigger('owl.prev');
  });
  $('.carousel-posts-nav-next').on('click', function(){
    $(this).parents('.grid-container').find('.carousel-posts').trigger('owl.next');;
  });

  /* Home Carousel
  ------------------------------------------------*/
  $(".home-carousel-posts").owlCarousel({
    items: 4,
    paginationSpeed: 300,
    rewindSpeed: 400
  });
  $('.carousel-posts-nav-prev').on('click', function(){
    $(this).parents('.grid-container').find('.home-carousel-posts').trigger('owl.prev');
  });
  $('.carousel-posts-nav-next').on('click', function(){
    $(this).parents('.grid-container').find('.home-carousel-posts').trigger('owl.next');;
  });

  /* qTip Init
  ------------------------------------------------*/
  $('[title]').qtip({
    position: {
      my: 'bottom center',
      at: 'top center',
    },
    style: {
      classes: 'qtip-tipsy qtip-shadow',
    },
    hide: {
      event: 'click mouseleave'
    }
  });

  /* qTip Init for comment form allowed tags
  ------------------------------------------------*/
  $('.comment-form-question').each(function() {
    $(this).qtip({
      content: {
        title: $('.form-allowed-tags .ftg-title'),
        text: $('.form-allowed-tags')
      },
      position: {
        my: 'bottom center',
        at: 'top center',
      },
      style: {
        classes: 'qtip-tipsy qtip-rounded',
      },
      hide: {
        event: 'click mouseleave'
      }
    });
  });

  /* Tag index filter
  ------------------------------------------------*/
  function smk_theme_keyword_index_filter(elem) {
    var value    = $(elem).val().toLowerCase(),
        headings = $('.keywords-index-list h4');

    // Hide or show headings
    value.length > 0 ? headings.hide() : headings.show();

    // Hide or show keywords
    $(".keywords-index-list li").each(function() {
      $(this).text().toLowerCase().search(value) > -1 ? $(this).removeClass('hide-keyword') : $(this).addClass('hide-keyword');
    });
  }
  $('.keywords-filter-block .filter-keywords').on( 'keyup', function(){
    smk_theme_keyword_index_filter(this);
  });

  $('.keywords-filter-block .filter-controls').on( 'click', '.control', function(){
    $(this).parent().children('.control').removeClass('active');
    $(this).addClass('active');
    if( $(this).hasClass('block') ){
      $('.keywords-index-list').addClass('display-block');
    }
    else{
      $('.keywords-index-list').removeClass('display-block');
    }
  });

  /* Mark recipe ingredient on single recipe page
  ------------------------------------------------*/
  $('.single-recipe-ingredients li').on( 'click', function(){
    $(this).toggleClass('active');
  });

  /* Profile user tabs
  ------------------------------------------------*/
  function smk_theme_profile_user_tabs(){
    $('.profile-mini-menu li:not(.link) a').on('click', function(event){
      event.preventDefault();
      var theid = $(this).attr('href');

      // The menu
      $('.profile-mini-menu li').removeClass('active');
      $(this).parent().addClass('active');

      //The tabs
      $('.profile-user-tab').removeClass('active');
      $(theid).addClass('active');
    });
  }
  smk_theme_profile_user_tabs();

  /* Recipes info
  ------------------------------------------------*/
  $('.recipe .recipe-info-pointer').on({
    'mouseenter': function(){
      $(this).next().addClass('active');
      $(this).prev().addClass('inactive');
    },
    'mouseleave': function(){
      $(this).prev().removeClass('inactive');
      $(this).next().removeClass('active');
    }
  });

  /* Jump to the top
  ------------------------------------------------*/
  function smk_theme_jump_to_it( _selector, _speed ){

    _speed = parseInt(_speed, 10) === _speed ? _speed : 300;

    $( _selector ).on('click', function(event){
      event.preventDefault();
      var url = $(this).attr('href'); //cache the url. This is the comment id(parent)

      // Animate the jump
      $("html, body").animate({
        scrollTop: parseInt( $(url).offset().top ) - 50
      }, _speed);

    });
  }
  smk_theme_jump_to_it( '.footer-to-top', 500);
});

})(jQuery);
