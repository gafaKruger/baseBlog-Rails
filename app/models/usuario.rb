class Usuario < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comentarios

  validates_presence_of :nome_completo, :email, :password
  validates_confirmation_of :password
  validates_length_of :nome_completo, minimum: 2, maximum: 50, allow_blank: true
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, format: {with: VALID_EMAIL_FORMAT}, uniqueness: true
  validates_length_of :email, minimum: 7, maximum: 50, allow_blank: false
  validates_length_of :password, minimum: 6, maximum: 50, allow_blank: false
  validates_length_of :apelido, maximum: 30, allow_blank: true
  before_save { self.email = email.downcase }

  #validates nome_completo, presence: true, length: {maximum: 50}
  #validates apelido, presence: false, length: {maximum: 20}
  #validates data_cadastro, presence: true, length: {maximum: 50}
  #validates password, presence: true, length: {minimum: 6}
  #VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  #validates email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: true}
  #before_save { self.email = email.downcase }

  def self.find_or_create_with_omniauth(params)
    @usuario = Authorization.find_or_create_by_provider_and_uid(params.provider, params.uid)
    if params[:provider] == "facebook"
      StrategyUsuarioFacebook.resposta(params)
    elsif params[:provider] == "twitter"
      StrategyUsuarioTwitter.resposta(params)
    elsif params[:provider] == "google+"
      StrategyUsuarioGoogle.resposta(params)
    elsif params[:provider] == "linkedin"
      StrategyUsuarioLinkedin.resposta(params)
    end
  end
end
