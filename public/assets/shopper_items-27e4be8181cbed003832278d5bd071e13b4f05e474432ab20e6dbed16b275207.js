(function() {
  $('.edit-button-active').click(function() {
    $('.edit-shopper-item-block').toggleClass('edit-shopper-item-block-active');
    $('.edit-extra-charge-block').toggleClass('edit-extra-charge-block-active');
    $('.cart-new-shopper-item').toggleClass('cart-new-shopper-item-active');
    if ($('.edit-cart-text').attr("data-editing") === "true") {
      $('.edit-cart-text').html("Edit Cart");
      return $('.edit-cart-text').attr("data-editing", "false");
    } else {
      $('.edit-cart-text').html("Done");
      return $('.edit-cart-text').attr("data-editing", "true");
    }
  });

}).call(this);
