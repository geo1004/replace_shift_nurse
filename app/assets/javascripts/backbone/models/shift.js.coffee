class Infirmiere.Models.Shift extends Backbone.Model
  paramRoot: 'shift'

  defaults:
    title: null
    content: null
    start_date: null
    end_date: null
    slot_type: null

class Infirmiere.Collections.AvailabilitiesCollection extends Backbone.Collection
  model: Infirmiere.Models.Shift
  url: '/shifts/available'

class Infirmiere.Collections.SeekingsCollection extends Backbone.Collection
  model: Infirmiere.Models.Shift
  url: '/shifts/seek'
