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
      $('div #payment').slideUp()
      $('#cancel_payment').slideUp()
      $('#add_payment').slideDown()

    #
    # Показывает дополнительные поля формы для добавления использованных материалов, если создается новое подключение
    #

    # Изначально форма для добавления материалов скрыта
    $('#materials').hide()
    #$('#material_1').hide()
    #$('#material_2').hide()
    #$('#material_3').hide()
    #$('#material_4').hide()


    # Показать форму для добавления материала если чекбокс отмечен и спрятать если нет
    $('#payment_client_new_connection').on 'change', ->
      if $(this).is(':checked')
        $('#materials').slideDown()
      else
        $('#materials').slideUp()

    # Добавление каждого материала по нажатию чекбокса
    $('#material_link_1').on 'change', ->
      if $(this).is(':checked')
        console.log('dfsf')
        $('#material_1').slideDown()
      else
        $('#material_1').slideUp()

    $('#material_link_2').on 'change', ->
      if $(this).is(':checked')
        console.log('dfsf')
        $('#material_2').slideDown()
      else
        $('#material_2').slideUp()

    $('#material_link_3').on 'change', ->
      if $(this).is(':checked')
        console.log('dfsf')
        $('#material_3').slideDown()
      else
        $('#material_3').slideUp()

    $('#material_link_4').on 'change', ->
      if $(this).is(':checked')
        console.log('dfsf')
        $('#material_4').slideDown()
      else
        $('#material_4').slideUp()

    #$('#first_material input').attr('name', 'payment[material_payments_attributes][0][quantity]')
    #$('#first_material input').attr('id', 'payment_material_payments_attributes_0_quantity')
    #$('#first_material select').attr('name', 'payment[material_payments_attributes][0][material_id]')
    #$('#first_material select').attr('id', 'payment_material_payments_attributes_0_material_id')