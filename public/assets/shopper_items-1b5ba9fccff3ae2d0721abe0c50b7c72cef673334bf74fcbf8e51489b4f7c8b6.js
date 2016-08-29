(function() {
  var editing;

  editing = false;

  $('.edit-cart').click(function() {
    $('.edit-shopper-item-block').toggleClass('edit-shopper-item-block-active');
    editing = !editing;
    if (editing) {
      return $('.edit-cart-text').html("Done");
    } else {
      return $('.edit-cart-text').html("Edit Cart");
    }
  });

}).call(this);
