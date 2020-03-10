//カテゴリーhover → parentカテゴリーshow
//hover外れる → parentカテゴリーhide
$(function() {
  $('\
    .header__inner__bottom__left__category,\
    .header__inner__bottom__left__category__toggle\
    ').hover( 
    function() {
      $('.header__inner__bottom__left__category__toggle__parent__tree').show();
    },
    function() {
      $('.header__inner__bottom__left__category__toggle__parent__tree').hide();
    }
  );
});

/////////////////////////////////////////////////////////////////////////////////////

//parentカテゴリーhover → childカテゴリーshow
$(function() {
  $('.header__inner__bottom__left__category__toggle__parent__tree').hover(
    function() {
      let parentId = $(this).data('id');
      $('.header__inner__bottom__left__category__toggle__child__tree').hide();
      $('[data-ancestry="' + parentId + '"]').show();
    }
  );
});
//childカテゴリーhover → grandchildカテゴリーshow
$(function() {
  $('.header__inner__bottom__left__category__toggle__child__tree').hover(
    function() {
      let parentId = $(this).data('ancestry');
      let childId = $(this).data('id');
      $('.header__inner__bottom__left__category__toggle__grandchild__tree').hide();
      $('[data-ancestry="' + parentId + "/" + childId + '"]').show();
    }
  );
});

/////////////////////////////////////////////////////////////////////////////////////

//hover外れる → child/grandchildカテゴリーhide
$(function() {
  $('.header__inner__bottom__left__category__toggle')
  .hover( 
    function() {
    },
    function() {
      $('.header__inner__bottom__left__category__toggle__child__tree').hide();
      $('.header__inner__bottom__left__category__toggle__grandchild__tree').hide();
    }
  );
});

/////////////////////////////////////////////////////////////////////////////////////

//各カテゴリー名前hover → 各カテゴリー名前オレンジ色に
$(function() {
  $('\
    .header__inner__bottom__left__category,\
    .header__inner__bottom__left__category__toggle__parent__tree__name,\
    .header__inner__bottom__left__category__toggle__child__tree__name,\
    .header__inner__bottom__left__category__toggle__grandchild__tree__name\
    ').hover( 
    function() {
      $(this).css("color","rgb(255, 179, 65)");
    },
    function() {
      $(this).css("color","rgb(51, 51, 51)");
    }
  );
});