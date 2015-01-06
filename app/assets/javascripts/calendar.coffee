$(document).on 'ready page:load', ->
  window.InfirmiereRouter = new Infirmiere.Routers.ShiftsRouter()
  Backbone.history.start({pushState: true})

  seekings = new Infirmiere.Collections.SeekingsCollection()

  shift_view = new Infirmiere.Views.Shifts.IndexView(
    el: $("#calendar")
    elements: seekings
  )

  calendar_type_view = new Infirmiere.Views.CalendarType.ButtonView(
    el: $("#calendar-type")
  )

  calendar_type_view.render()
  shift_view.render()

  $('.sidebar-tools li a').click (e)->
    e.preventDefault()
    $(@).tab('show')

  calendars = [
                'seeking-startdate'
                'seeking-enddate'
                'availability-startdate'
                'availability-enddate'
              ]

  for calendar_type in calendars
    $("##{calendar_type}").datetimepicker(
      language: 'fr'
      icons:
        time: "fa fa-clock-o"
        date: "fa fa-calendar"
        up: "fa fa-arrow-up"
        down: "fa fa-arrow-down"
    )
