# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
quantity = 1

$itemNameField  = (base) ->
  $('.item-' + base.parents('.item-block').data("item-id"))

$itemPriceField  = (base) ->
  $('.item-price-' + base.parents('.item-block').data("item-id"))

baseItemName = (base) ->
  base.parents('.item-block').data("item-name")

baseItemPrice = (base) ->
  parseInt(base.parents('.item-block').data("item-price"))

incrementItemQuantity = (base) ->
  itemName = if quantity > 1 then pluralize(baseItemName(base)) else baseItemName(base)
  $itemNameField(base).html(quantity.toString() + " " + itemName)
  $itemPriceField(base).html("$" + (quantity * baseItemPrice(base)).toFixed(2).toString())

removeAllItemQuantity = ->
  $('.item-name').each ->
    $itemNameField($(this)).html(baseItemName($(this)))
  $('.item-price').each ->
    $itemPriceField($(this)).html("$" + baseItemPrice($(this)).toFixed(2).toString())

$(document).keyup ->
  query = $('#search-items').val()
  sale_id = $('#search-sale-id').val()
  $.ajax
    type: 'GET'
    url: '/items'
    data:
      query: query
      sale_id: sale_id
  return

# Initial click
$('.item-block-top').click ->
  quantity = 1
  $('.item-block').removeClass 'item-block-active'
  removeAllItemQuantity()
  incrementItemQuantity $(this)
  $(this).parent().toggleClass 'item-block-active'
  return

$('.plus').click ->
  quantity += 1
  incrementItemQuantity $(this)
  return

$('.minus').click ->
  quantity -= 1
  if quantity == 0
    $('.item-block').removeClass 'item-block-active'
    removeAllItemQuantity()
    quantity = 1
  else
    incrementItemQuantity $(this)
  return