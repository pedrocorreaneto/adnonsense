json.array!(@creatives) do |creative|
  json.extract! creative, :id, :bid, :adtext, :ad_id
  json.url creative_url(creative, format: :json)
end
