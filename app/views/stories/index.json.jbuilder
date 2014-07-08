json.array!(@stories) do |story|
  json.extract! story, :id, :text, :title, :deleted_at, :user_id
  json.url story_url(story, format: :json)
end
