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
    size:
      height: 200
    axis:
      x:
        type: 'timeseries'
        tick:
          format: '%Y-%m-%d'
      y:
        label:
          text: 'процент вывода'
          position: 'outer-middle'

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init