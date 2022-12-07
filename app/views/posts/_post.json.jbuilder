json.extract! post, :id, :title, :content, :updated_at
json.url post_url(post, format: :json)
