Infirmiere.Views.Shifts ||= {}

class Infirmiere.Views.Shifts.IndexView extends Backbone.View
  initialize: () ->
    @options.elements.bind('reset', @addAll)

  addAll: () =>
    if @options.elements.length > 0
      $(@el).fullCalendar(
        'addEventSource',
        formatShiftsJson(@options.elements, '#6AA079')
      )


  updateEvent: (new_elements) =>
    $(@el).fullCalendar('removeEvents')
    $(@el).fullCalendar(
      'addEventSource',
      formatShiftsJson(new_elements, '#6AA079')
    )
    $(@el).fullCalendar('rerenderEvents')

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
    @
