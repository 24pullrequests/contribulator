$(document).on "turbolinks:load", ->
  setTimeout (-> $(".alert").fadeOut(350)), 2500
