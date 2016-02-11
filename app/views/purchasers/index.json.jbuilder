json.array!(@purchasers) do |purchaser|
  json.extract! purchaser, :id, :person_id, :cuil_cuit
  json.url purchaser_url(purchaser, format: :json)
end
