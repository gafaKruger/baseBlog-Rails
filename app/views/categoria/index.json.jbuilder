json.array!(@categoria) do |categorium|
  json.extract! categorium, :id, :nome, :post_id
  json.url categorium_url(categorium, format: :json)
end
