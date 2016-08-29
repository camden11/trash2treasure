(function() {
  var $itemNameField, $itemPriceField, active_id, baseItemName, baseItemPrice, incrementItemQuantity, quantity, removeAllItemQuantity;

  quantity = 1;

  active_id = -1;

  $itemNameField = function(base) {
    return $('.item-' + base.parents('.item-block').data("item-id"));
  };

  $itemPriceField = function(base) {
    return $('.item-price-' + base.parents('.item-block').data("item-id"));
  };

  baseItemName = function(base) {
    return base.parents('.item-block').data("item-name");
  };

  baseItemPrice = function(base) {
    return parseInt(base.parents('.item-block').data("item-price"));
  };

  incrementItemQuantity = function(base) {
    var itemName;
    itemName = quantity > 1 ? pluralize(baseItemName(base)) : baseItemName(base);
    $itemNameField(base).html(quantity.toString() + " " + itemName);
    return $itemPriceField(base).html("$" + (quantity * baseItemPrice(base)).toFixed(2).toString());
  };

  removeAllItemQuantity = function() {
    $('.item-name').each(function() {
      return $itemNameField($(this)).html(baseItemName($(this)));
    });
    return $('.item-price').each(function() {
      return $itemPriceField($(this)).html("$" + baseItemPrice($(this)).toFixed(2).toString());
    });
  };

  $('.item-block-top').click(function() {
    console.log("yo");
    quantity = 1;
    $('.item-block').removeClass('item-block-active');
    removeAllItemQuantity();
    incrementItemQuantity($(this));
    $(this).parent().toggleClass('item-block-active');
  });

  $('.plus').click(function() {
    quantity += 1;
    incrementItemQuantity($(this));
  });

  $('.minus').click(function() {
    quantity -= 1;
    if (quantity === 0) {
      $('.item-block').removeClass('item-block-active');
      removeAllItemQuantity();
      quantity = 1;
    } else {
      incrementItemQuantity($(this));
    }
  });

  $('.item-block-bottom').click(function() {
    $.ajax({
      type: 'POST',
      url: '/shopper_items',
      data: {
        item_id: $(this).parents('.item-block').data("item-id"),
        quantity: quantity
      }
    });
    quantity = 1;
    $('.item-block').removeClass('item-block-active');
    return removeAllItemQuantity();
  });

}).call(this);
