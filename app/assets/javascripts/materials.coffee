# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $ ->
    #
    # Форма добавления нового материала
    #
    # Изначаньно форма и кнопка отмены скрыты
    $('#material, #cancel_material').hide()
    # Показывает форму добавления материала и кнопку отмены. Кнопка добавленияя материала скрывется
    $('#add_material').on 'click', ->
      $('div #material').slideDown()
      $('#cancel_material').slideDown()
      $('#add_material').slideUp()
    # Скрывает форму добавления материала и кнопку отмены. Кнопка добавления материала отображается
    $('#cancel_material').on 'click', ->
      $('div #material').slideUp()
      $('#cancel_material').slideUp()
      $('#add_material').slideDown()