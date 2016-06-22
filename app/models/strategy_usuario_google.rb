class StrategyUsuarioGoogle < Usuario
  GOOGLE_SUCESSO = 202
  GOOGLE_PENDENTE = 400

  def self.resposta(params)
    resposta = autenticar(params)
    if (resposta = GOOGLE_SUCESSO)
      status, mensagem = true, 'Login realizado com sucesso'
    elsif (resposta = GOOGLE_PENDENTE)
      status, mensagem = false, 'Aplicação bloqueada'
    else
      status, mensagem = false, 'Não foi possível autenticar'
    end
  end

  def self.autenticar(auth)
    #@usuario = Authorization.find_or_create_by_provider_and_uid(params.provider, params.uid)
    #@usuario = self.find_or_create_by_provider_and_uid(auth.provider, auth.uid)
    #@usuario.assign_attributes({ name: auth.info.name, email: auth.info.email, photo_url: auth.info.image, access_token: auth.credentials.token })
    @usuario.assign_attributes({ nome_completo: auth.info.name, secret: auth.credentials.secret,
      access_token: auth.credentials.token, provider: auth.provider, uid: auth.uid, sexo: auth.info.gender, apelido: auth.info.last_name })
    @usuario.save!
    @usuario
  end
end
