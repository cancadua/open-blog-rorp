json.extract! post, :id, :title, :content, :updated_on, :tag_list
json.url post_url(post, format: :json)
