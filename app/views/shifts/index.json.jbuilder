json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :title, :content, :start_date, :end_date, :slot_type
  json.url shift_url(availability, format: :json)
end
json.array!(@seekings) do |seeking|
  json.extract! seeking, :id, :title, :content, :start_date, :end_date, :slot_type
  json.url shift_url(seeking, format: :json)
end
