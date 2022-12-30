json.extract! comment, :id, :title, :content, :post_id, :updated_on
json.url comment_url(comment, format: :json)
