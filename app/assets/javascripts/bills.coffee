# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '#delete-item', (e) ->  
  e.preventDefault()
  $('#delete-item').parent().parent().remove()

$(document).on 'turbolinks:load', ->
  $('#add-item').click (e) ->
    e.preventDefault()
    row_id = $('#bills-form-table tr:last')[0].children[1].children[0]
    if row_id != undefined
      row_id = row_id.name.match(/\d+/)[0]
    else
      row_id = -1
    bill_id = $(this)
    $.ajax({
      type: "POST",
      url: '/bills/add_item/',
      dataType: 'script',
      data: {row_id: row_id}
    }) 
$(document).on 'change', '.amount-field', (e) ->
  e.preventDefault()
  value = this.children[0].value
  sum = 0
  $('.amount-field').each ->
    amount = $(this)[0].children[0].value
    if !isNaN(amount) and amount.length != 0
      sum += parseFloat(amount)
    $('#item-total').html(sum)
    $('#bill_total').val(sum) 


