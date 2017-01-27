# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $ ->
    $('p#test').addClass('text-hide')
    #при нажатии на кнопку с id="submit"
    console.log('test')
    $('#submit').on 'click', ->
      #переменная formValid
      formValid = true
      #перебрать все элементы управления input
      $('input').each ->
        #найти предков, которые имеют класс .form-group, для установления success/error
        formGroup = $(this).parents('.form-group')
        #найти fa, который предназначен для показа иконки успеха или ошибки
        fa = formGroup.find('.form-control')
        #для валидации данных используем HTML5 функцию checkValidity
        if @checkValidity()
          #добавить к formGroup класс .has-success, удалить has-error
          formGroup.addClass('has-success').removeClass 'has-danger'
          #добавить к fa класс fa-ok, удалить fa-remove
          fa.addClass('form-control-success').removeClass 'form-control-danger'
        else
          #добавить к formGroup класс .has-error, удалить .has-success
          formGroup.addClass('has-danger').removeClass 'has-success'
          #добавить к fa класс fa-remove, удалить fa-ok
          fa.addClass('form-control-danger').removeClass 'form-control-success'
          #отметить форму как невалидную
          formValid = false
        return
      #если форма валидна, то
      if formValid
        #сркыть модальное окно
        $('#modalMaterial').modal 'hide'
      return
    return