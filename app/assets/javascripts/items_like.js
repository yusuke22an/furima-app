//いいね!一覧リストhover → 背景薄い灰色/矢印1px右・緑色
$(function() {
  $('.like_items__container__right__lists__list').hover( 
    function() {
      $(this).css("background-color","rgb(250, 250, 250)");
      $(this).children('.like_items__container__right__lists__list__arrow').css(
        "transform", "translate(1px)"
      );
      $(this).children('.like_items__container__right__lists__list__arrow').css(
        "color","rgb(60, 202, 206)"
      );
    },
    function() {
      $(this).css("background-color","rgb(255, 255, 255)");
      $(this).children('.like_items__container__right__lists__list__arrow').css(
        "transform", "translate(-1px)"
      );
      $(this).children('.like_items__container__right__lists__list__arrow').css(
        "color","rgb(220, 220, 220)"
      );
    }
  );
});


