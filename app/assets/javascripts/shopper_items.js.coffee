$('.edit-button-active').click ->
  $('.edit-shopper-item-block').toggleClass('edit-shopper-item-block-active')
  if $('.edit-cart-text').attr("data-editing") == "true"
    $('.edit-cart-text').html("Edit Cart")
    $('.edit-cart-text').attr("data-editing", "false")
  else
    $('.edit-cart-text').html("Done")
    $('.edit-cart-text').attr("data-editing", "true")