json.extract! post, :id, :title, :content, :updated_on
json.url post_url(post, format: :json)
