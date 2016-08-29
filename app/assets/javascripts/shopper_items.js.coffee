editing = false

$('.edit-cart').click ->
  $('.edit-shopper-item-block').toggleClass('edit-shopper-item-block-active')
  editing = not editing
  if editing
    $('.edit-cart-text').html("Done")
  else
    $('.edit-cart-text').html("Edit Cart")