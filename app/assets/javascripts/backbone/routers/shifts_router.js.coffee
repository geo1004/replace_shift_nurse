class Infirmiere.Routers.ShiftsRouter extends Backbone.Router
  initialize: (options) ->
    @shifts = new Infirmiere.Collections.ShiftsCollection()
    @shifts.reset options.shifts

  routes:
    "new"      : "newShift"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newShift: ->
    @view = new Infirmiere.Views.Shifts.NewView(collection: @shifts)
    $("#shifts").html(@view.render().el)

  index: ->
    @view = new Infirmiere.Views.Shifts.IndexView(shifts: @shifts)
    $("#shifts").html(@view.render().el)

  show: (id) ->
    shift = @shifts.get(id)

    @view = new Infirmiere.Views.Shifts.ShowView(model: shift)
    $("#shifts").html(@view.render().el)

  edit: (id) ->
    shift = @shifts.get(id)

    @view = new Infirmiere.Views.Shifts.EditView(model: shift)
    $("#shifts").html(@view.render().el)
