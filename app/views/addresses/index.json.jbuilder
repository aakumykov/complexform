json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :person_id
  json.url address_url(address, format: :json)
end
