json.array!(@bills) do |bill|
  json.extract! bill, :id, :client_id, :person_id, :integer_amount, :decimal_amount, :description, :date
  json.url bill_url(bill, format: :json)
end
