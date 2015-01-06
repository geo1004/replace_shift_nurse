# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#birthday").datetimepicker(
    language: 'fr'
    pickTime: false
    icons:
      time: "fa fa-clock-o"
      date: "fa fa-calendar"
      up: "fa fa-arrow-up"
      down: "fa fa-arrow-down"
  )
