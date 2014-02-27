json.array!(@comments) do |comment|
  json.extract! comment, :id, :comment, :name, :room_id
  json.url comment_url(comment, format: :json)
end
