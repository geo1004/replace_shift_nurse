class Infirmiere.Routers.ShiftsRouter extends Backbone.Router
  initialize: (options) ->
    @availabilities = new Infirmiere.Collections.AvailabilitiesCollection()
    @seekings = new Infirmiere.Collections.SeekingsCollection()
    @availabilities.fetch()
    @seekings.fetch()

  routes:
    "availabilities" : "availabilities"
    "seekings" : "seekings"
    ".*"        : "seekings"

  availabilities: ->
    @view = new Infirmiere.Views.Shifts.IndexView(
      el: $("#calendar")
      elements: @availabilities
    )
    @view.updateEvent(@availabilities)

  seekings: ->
    @view = new Infirmiere.Views.Shifts.IndexView(
      el: $("#calendar")
      elements: @seekings
    )
    @view.updateEvent(@seekings)
