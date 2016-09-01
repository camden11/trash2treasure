searchParams = ->
  params = 
    query: $('#search-items').val()
    sale_id: $('#search-sale-id').val()
  $('.item-category').each ->
    category = $(this).data('category')
    checked = if $(this).is(':checked') then 1 else 0
    params[category] = checked
    return
  params

$(document).keyup ->
  query = $('#search-items').val()
  if query.length > 0
    $('.btn-item-search').removeClass('btn-item-search-inactive');
  else
    $('.btn-item-search').addClass('btn-item-search-inactive');
  sale_id = $('#search-sale-id').val()
  params = 
    query: query
    sale_id: sale_id
  $.ajax
    type: 'GET'
    url: '/items'
    data: searchParams()
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

$('.panel-heading-link').click ->
  $('.panel-heading').toggleClass('panel-heading-active')