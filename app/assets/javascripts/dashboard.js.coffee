# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $ ->
    # Активируем всплывающие подсказки
    $('[data-toggle="tooltip"]').tooltip()
    
    # Сделать активной ссылку в боковом меню
    title = $('title').text().split(' ', 1).toString()
    $('#side_navigation').children('li').each ->
      if $(this).text().indexOf(title) == 2
        $(this).addClass('active_navigation_button')
      return