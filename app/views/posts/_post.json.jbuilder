json.extract! post, :id, :title, :description, :body, :likes, :category_id, :created_at, :updated_at
json.url post_url(post, format: :json)
