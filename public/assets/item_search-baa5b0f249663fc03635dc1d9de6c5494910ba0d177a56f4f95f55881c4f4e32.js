(function() {
  var search, searchParams;

  searchParams = function() {
    var params;
    params = {
      query: $('#search-items').val(),
      sale_id: $('#search-sale-id').val()
    };
    $('.item-category').each(function() {
      var category, checked;
      category = $(this).data('category');
      checked = $(this).is(':checked') ? 1 : 0;
      params[category] = checked;
    });
    return params;
  };

  search = function() {
    var params, query, sale_id;
    query = $('#search-items').val();
    if (query.length > 0) {
      $('.btn-item-search').removeClass('btn-item-search-inactive');
    } else {
      $('.btn-item-search').addClass('btn-item-search-inactive');
    }
    sale_id = $('#search-sale-id').val();
    params = {
      query: query,
      sale_id: sale_id
    };
    $.ajax({
      type: 'GET',
      url: '/items',
      data: searchParams()
    });
  };

  $(document).keyup(search);

  $('.item-category').click(search);

  $('.btn-item-search').click(function() {
    $('#search-items').val("");
    search();
  });

  $('.panel-heading-link').click(function() {
    $('.panel-heading').toggleClass('panel-heading-active');
  });

  $('#clear-filter').click(function() {
    $('.item-category').attr('checked', false);
    search();
  });

}).call(this);
