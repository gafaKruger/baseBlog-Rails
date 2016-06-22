class StrategyUsuarioFacebook < Usuario
  FACEBOOK_SUCESSO = 200
  FACEBOOK_REVOGADO = 403
  FACEBOOK_BLOQUEADO = 408

  def self.resposta(params)
    resposta = autenticar(params)
    if (resposta = FACEBOOK_SUCESSO)
      status, mensagem = true, 'Login realizado com sucesso'
    elsif (resposta = FACEBOOK_REVOGADO)
      status, mensagem = false, 'Acesso revogado'
    elsif (resposta = FACEBOOK_BLOQUEADO)
      status, mensagem = false, 'Aplicação bloqueada'
    else
      status, mensagem = false, 'Não foi possível autentircar'
    end
  end

  def self.autenticar(auth)
    #@usuario = Authorization.find_or_create_by_provider_and_uid(params.provider, params.uid)
    #@usuario = self.find_or_create_by_provider_and_uid(auth.provider, auth.uid)
    #@usuario.assign_attributes({ name: auth.info.name, email: auth.info.email, photo_url: auth.info.image, access_token: auth.credentials.token })
    @usuario.assign_attributes({ nome_completo: auth.info.name, email: auth.info.email, secret: auth.credentials.secret,
      access_token: auth.credentials.token, provider: auth.provider, uid: auth.uid, sexo: auth.info.gender, apelido: auth.info.last_name })
    @usuario.save!
    @usuario
  end
end
