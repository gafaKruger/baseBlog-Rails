json.array!(@categoria_posts) do |categoria_post|
  json.extract! categoria_post, :id, :categoria_id, :post_id
  json.url categoria_post_url(categoria_post, format: :json)
end
