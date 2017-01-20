# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $ ->
    # Инициализация всплывающих подсказок
    #$('[data-toggle="tooltip"]').tooltip()

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
    $('#material_payments').hide()
    # Показать форму для добавления материала если чекбокс отмечен и спрятать если нет
    $('#payment_client_new_connection').on 'change', ->
      if $(this).is(':checked')
        $('#material_payments').slideDown()
      else
        $('#material_payments').slideUp()


    #
    # Показать детализацию платежа для нового подключения
    #
    # Изначально детализация платежа скрыта
    $('.detail_fields').hide()
    $('.hide_payment_details_for_new_connection').hide()
    # Паказывает детали платежа при нажатии на ссылку
    $('.show_payment_details_for_new_connection').on 'click', ->
      parent = $(this).parents('tr')
      $(parent.next('tr')).slideToggle()


    #
    # Выбор даты отчета
    #
    $('#datetimepicker1').datetimepicker
      locale:           'en'
      format:           'YYYY-MM-DD'
      showTodayButton:  true
      defaultDate:      new Date()
      maxDate:          new Date()

    $('#datetimepicker2').datetimepicker
      locale:           'en'
      format:           'YYYY-MM-DD'
      showTodayButton:  true
      defaultDate:      new Date()
      maxDate:          new Date()
      useCurrent:       false

    $('#datetimepicker1').on 'dp.change', (e) ->
      $('#datetimepicker2').data('DateTimePicker').minDate(e.date)
      start_date = $('#selected_date').val()

    $('#datetimepicker2').on 'dp.change', (e) ->
      $('#datetimepicker1').data('DateTimePicker').maxDate(e.date)
      end_date = $('#selected_date').val()

    $('#update_menu').on 'click', ->
      $('selected_date').text(selected_date)