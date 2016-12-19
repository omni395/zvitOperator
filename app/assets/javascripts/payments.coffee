# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $ ->
    #
    # Форма добавления нового платежа
    #
    # Изначаньно форма и кнопка отмены скрыты
    $('#payment, #cancel_payment').hide()

    # Показывает форму добавления платежа и кнопку отмены. Кнопка добавленияя платежа скрывется
    $('#add_payment').on 'click', ->
      $('div #payment').slideDown()
      $('#cancel_payment').slideDown()
      $('#add_payment').slideUp()

    # Скрывает форму добавления платежа и кнопку отмены. Кнопка добавления платежа отображается
    $('#cancel_payment').on 'click', ->
      $('div #payment').slideUp('slow')
      $('#cancel_payment').slideUp()
      $('#add_payment').slideDown()

    # Показывает дополнительные поля формы, если создается новое подключение
    $('#payment_client_new_connection').on 'change', ->
      if $(this).is(':checked')
        console.log('1')
      else
        console.log('2')