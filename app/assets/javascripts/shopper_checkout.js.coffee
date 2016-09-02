url = ->
  return '/shoppers/' + $('#checkout').data('shopper-id') + '/checkout'

setInterval (->
  $.ajax
    type: 'GET'
    url: url()
  ), 10000