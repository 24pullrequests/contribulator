$(document).on "turbolinks:load", ->
  $(".js-emoji").each ->
    $(@).html(emojione.toImage($(@).text()))
