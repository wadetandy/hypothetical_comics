json.array!(@comments) do |comment|
  json.extract! comment, :id, :text, :deleted_at, :user_id
  json.url comment_url(comment, format: :json)
end
