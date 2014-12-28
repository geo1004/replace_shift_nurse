window.formatShiftsJson = (shifts, color) ->
  shifts = shifts.toJSON()
  _.each shifts, (el) ->
    el['start'] = el['start_date']
    el['end'] = el['end_date']
    el['color'] = color
  shifts
