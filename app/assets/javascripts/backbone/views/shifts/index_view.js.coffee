Infirmiere.Views.Shifts ||= {}

class Infirmiere.Views.Shifts.IndexView extends Backbone.View
  initialize: () ->
    @options.availabilities.bind('reset', @addAll)
    @options.seekings.bind('reset', @addAll)

  addAll: () =>
    if @options.availabilities.length > 0
      $(@el).fullCalendar(
        'addEventSource',
        formatShiftsJson(@options.availabilities, '#6AA079')
      )

    if @options.seekings.length > 0
      $(@el).fullCalendar(
        'addEventSource',
        formatShiftsJson(@options.seekings, '#EA7481')
      )

  render: =>
    $(@el).fullCalendar({
      header:
        left: 'prev,next today'
        center: 'title'
        right: 'month,agendaWeek,agendaDay'

      lang: 'fr'
      weekNumbers: true
      editable: true
      selectable: true
    })
    @addAll()
