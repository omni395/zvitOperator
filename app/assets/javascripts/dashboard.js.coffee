# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $ ->
    # Сделать активной ссылку в боковом меню
    title = $('title').text().split(' ', 1).toString()
    $('#side_navigation').children('li').firstChild('a').each ->
      menu_elem = $(this).text().toString()
      console.log(typeOf: title)
      console.log(typeOf: menu_elem)
      console.log(menu_elem == title)
      #if title == menu_elem
      #  $(this).addClass('active_navigation_button')

      #return