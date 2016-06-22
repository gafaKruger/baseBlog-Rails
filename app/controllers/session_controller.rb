class SessionController < ApplicationController
  before_action :block_access, except: [:destroy]

  def new
  end

  def create
    @usuario = Usuario.find_by(email: params[:session][:email].downcase)
    if @usuario && @usuario.authenticate(params[:session][:password])
      login(@usuario)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def create_rede_social
    auth = request.env["omniauth.auth"]
    @usuario = Usuario.find_or_create_with_omniauth(auth)
    session[:usuario_id] = @usuario.id
    if @usuario && @usuario.authenticate(params[:session])
      login(@usuario)
      redirect_to @usuario
    else
      render 'new'
    end
  end

  def email_twitter

  end

  def failure
    redirect_to root_url
  end

  def destroy
    logout
    redirect_to root_url
  end
end
