Infirmiere.Views.Shifts ||= {}

class Infirmiere.Views.Shifts.ShowView extends Backbone.View
  template: JST["backbone/templates/shifts/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
