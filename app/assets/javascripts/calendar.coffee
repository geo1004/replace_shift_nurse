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
