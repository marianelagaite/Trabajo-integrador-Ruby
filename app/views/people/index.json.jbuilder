json.array!(@people) do |person|
  json.extract! person, :id, :name, :cuilCuit, :trash
  json.url person_url(person, format: :json)
end
