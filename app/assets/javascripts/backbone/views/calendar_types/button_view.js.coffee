Infirmiere.Views.CalendarType ||= {}

class Infirmiere.Views.CalendarType.ButtonView extends Backbone.View
  template : JST["backbone/templates/calendar_types/button_view"]

  events:
    'click .seeking-shifts' : 'display_seekings_calendar'
    'click .availability-shifts' : 'display_availabilities_calendar'

  display_seekings_calendar: ->
    $('.availability-shifts').addClass('disabled')
    $('.seeking-shifts').removeClass('disabled')

    if Backbone.history.fragment != "seekings"
      window.InfirmiereRouter.navigate('seekings', true)

  display_availabilities_calendar: ->
    $('.availability-shifts').removeClass('disabled')
    $('.seeking-shifts').addClass('disabled')

    if Backbone.history.fragment != "availabilities"
      window.InfirmiereRouter.navigate('availabilities', true)

  render: =>
    $(@el).html(@template)
    if Backbone.history.fragment == "seekings"
      @display_seekings_calendar()
    else if Backbone.history.fragment == "availabilities"
      @display_availabilities_calendar()
    @
