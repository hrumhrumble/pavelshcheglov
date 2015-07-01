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
    bindto: '.top_chart'
    data:
      x: 'x'
      columns: $('.top_chart').data('c3')
      type: 'area-spline'
    legend:
      show: false
    size:
      height: 200
    padding:
      left: 30
      top: 5
      right: 10
    axis:
      x:
        type: 'timeseries'
        tick:
          format: '%Y-%m-%d'
    tooltip:
      format:
        value: (value, ratio, id) ->
          return value + "%"

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init