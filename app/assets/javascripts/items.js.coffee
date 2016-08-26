# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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