#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

init = ->
  setTimeout(->
    $('.flash_msg').fadeOut(1000)
  ,2000)

$(document).on('page:change', init)

# ie8 turbolinks fix
unless Turbolinks.supported
  $ init