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