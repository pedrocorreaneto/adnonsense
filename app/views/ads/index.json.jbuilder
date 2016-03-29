json.array!(@ads) do |ad|
  json.extract! ad, :id, :budget
  json.url ad_url(ad, format: :json)
end
