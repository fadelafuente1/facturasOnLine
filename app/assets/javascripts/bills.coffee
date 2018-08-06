# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#add-item').click (e) ->
    e.preventDefault()
    bill_id = $(this)
    $.ajax({
      type: "POST",
      url: '/bills/add_item/',
      dataType: 'script',
      data: {}
    })