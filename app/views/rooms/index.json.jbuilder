json.array!(@rooms) do |room|
  json.extract! room, :id, :title, :uid
  json.url room_url(room, format: :json)
end
