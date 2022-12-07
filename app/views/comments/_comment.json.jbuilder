json.extract! comment, :id, :title, :content, :post_id, :updated_at
json.url comment_url(comment, format: :json)
