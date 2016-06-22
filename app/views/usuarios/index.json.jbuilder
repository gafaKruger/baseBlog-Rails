json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nome_completo, :apelido, :sexo, :email, :data_cadastro
  json.url usuario_url(usuario, format: :json)
end
