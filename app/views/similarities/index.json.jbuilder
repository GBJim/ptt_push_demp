json.array!(@similarities) do |similarity|
  json.extract! similarity, :id, :score, :user_id, :partner, :user_id
  json.url similarity_url(similarity, format: :json)
end
