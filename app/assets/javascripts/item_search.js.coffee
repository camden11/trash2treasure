$(document).keyup ->
  query = $('#search-items').val()
  if query.length > 0
    $('.btn-item-search').removeClass('btn-item-search-inactive');
  else
    $('.btn-item-search').addClass('btn-item-search-inactive');
  sale_id = $('#search-sale-id').val()
  $.ajax
    type: 'GET'
    url: '/items'
    data:
      query: query
      sale_id: sale_id
  return

$('.btn-item-search').click ->
  $('#search-items').val("");
  sale_id = $('#search-sale-id').val()
  $.ajax
    type: 'GET'
    url: '/items'
    data:
      query: ""
      sale_id: sale_id
  $('.btn-item-search').addClass('btn-item-search-inactive');
  return