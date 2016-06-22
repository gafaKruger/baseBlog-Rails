json.array!(@comentario_autenticados) do |comentario_autenticado|
  json.extract! comentario_autenticado, :id, :comentario_id, :usuario_id
  json.url comentario_autenticado_url(comentario_autenticado, format: :json)
end
