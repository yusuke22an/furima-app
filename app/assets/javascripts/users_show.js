//画面左側リストhover → 背景薄い灰色/矢印1px右・緑色
$(function() {
  $('.mypage__container__left__nav__list__item').hover( 
    function() {
      $(this).css("background-color","rgb(250, 250, 250)");
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "transform", "translate(1px)"
      );
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "color","rgb(60, 202, 206)"
      );
    },
    function() {
      $(this).css("background-color","rgb(255, 255, 255)");
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "transform", "translate(-1px)"
      );
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "color","rgb(220, 220, 220)"
      );
    }
  );
});

//画面左側activeリストhover → 矢印1px右・緑色
$(function() {
  $('.mypage__container__left__nav__list__item--active').hover( 
    function() {
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "transform", "translate(1px)"
      );
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "color","rgb(60, 202, 206)"
      );
    },
    function() {
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "transform", "translate(-1px)"
      );
      $(this).children('.mypage__container__left__nav__list__item__arrow').css(
        "color","rgb(220, 220, 220)"
      );
    }
  );
});




