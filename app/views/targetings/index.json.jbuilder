json.array!(@targetings) do |targeting|
  json.extract! targeting, :id, :places, :gender, :ad_id
  json.url targeting_url(targeting, format: :json)
end
