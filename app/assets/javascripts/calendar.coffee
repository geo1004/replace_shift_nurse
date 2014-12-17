# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.formatShiftsJson = (shifts, color) ->
  shifts = shifts.toJSON()
  _.each shifts, (el) ->
    el['start'] = el['start_date']
    el['end'] = el['end_date']
    el['color'] = color
  shifts

$(document).on 'ready page:load', ->
  availabilities = new Infirmiere.Collections.AvailabilitiesCollection()
  seekings = new Infirmiere.Collections.SeekingsCollection()

  shift_view = new Infirmiere.Views.Shifts.IndexView(
    el: $("#calendar")
    availabilities: availabilities
    seekings: seekings
  )

  availabilities.fetch()
  seekings.fetch()

  shift_view.render()
