# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $ ->
    $('#new_payment_form, #cancel_payment').css('display', 'none')
    $('#add_payment').on 'click', ->
      $('#title_payment').html('<h2>Добавить платеж</h2>')
      $(this).css('display', 'none')
      $('#new_payment_form, #cancel_payment').css('display', 'block')

    $('#cancel_payment').on 'click', ->
      $('#add_payment').css('display', 'block')
      $('#cancel_payment, #new_payment_form').css('display', 'none')
      $('#title_payment').html('<h2>Список платежей</h2>')