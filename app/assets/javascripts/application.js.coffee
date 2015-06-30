#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require vendor/d3
#= require vendor/c3
#= require_tree .

init = ->
  setTimeout(->
    $('.flash_msg').fadeOut(1000)
  ,2000)

  chart = c3.generate
    data:
      columns: [$('.top_chart').data('top')]
      type: 'area-spline'
      labels: false
    size:
      height: 250

  $('.top_chart').append(chart.element)

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init