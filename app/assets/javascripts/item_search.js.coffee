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

search = ->
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

$(document).keyup search
$('.item-category').click search

$('.btn-item-search').click ->
  $('#search-items').val("");
  search()
  return

$('.panel-heading-link').click ->
  $('.panel-heading').toggleClass('panel-heading-active')
  return

$('#clear-filter').click ->
  $('.item-category').attr('checked', false)
  search()
  return