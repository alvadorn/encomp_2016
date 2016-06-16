json.array!(@workshops) do |workshop|
  json.extract! workshop, :id, :name, :start_time, :end_time, :description
  json.url workshop_url(workshop, format: :json)
end
