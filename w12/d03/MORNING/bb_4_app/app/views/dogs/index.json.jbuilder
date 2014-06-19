json.array!(@dogs) do |dog|
  json.extract! dog, :id, :name, :password_digest
  json.url dog_url(dog, format: :json)
end
