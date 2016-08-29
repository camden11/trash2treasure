(function() {
  var $itemNameField, $itemPriceField, baseItemName, baseItemPrice, incrementItemQuantity, quantity, removeAllItemQuantity;

  quantity = 1;

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

  $(document).keyup(function() {
    var query, sale_id;
    query = $('#search-items').val();
    sale_id = $('#search-sale-id').val();
    $.ajax({
      type: 'GET',
      url: '/items',
      data: {
        query: query,
        sale_id: sale_id
      }
    });
  });

  $('.item-block-top').click(function() {
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

}).call(this);
