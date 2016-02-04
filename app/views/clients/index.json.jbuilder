json.array!(@clients) do |client|
  json.extract! client, :id, :name, :surname, :birthday, :gender, :dni
  json.url client_url(client, format: :json)
end
