class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :destroy]
  include UsuariosHelper

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    @usuario.data_cadastro = Date.current
    @usuario.adm = false
    #@usuario.provider = 'core'

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuário criado com sucesso!' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])
      if @usuario.update_attributes(usuario_params)
        redirect_to usuarios_path
      else
        render action: :edit
      end
    #respond_to do |format|
      #if @usuario.update(usuario_params)
        #format.html { redirect_to @usuario, notice: 'Usuário atualizado com sucesso.' }
        #format.json { render :show, status: :ok, location: @usuario }
      #else
        #format.html { render :edit }
        #format.json { render json: @usuario.errors, status: :unprocessable_entity }
      #end
    #end
  end

  def permissao_admin
    @usuario = Usuario.find(params[:id])
    @usuario.adm = true
    @usuario.update_attributes(usuario_params)
    redirect_to usuarios_path
  end

  def revogar_admin
    @usuario = Usuario.find(params[:id])
    @usuario.adm = false
    @usuario.update_attributes(usuario_params)
    redirect_to usuarios_path
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    logout
    redirect_to root_path
    #respond_to do |format|
      #format.html { redirect_to usuarios_url, notice: 'Usuário excluído com sucesso.' }
      #format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome_completo, :apelido, :email, :data_cadastro, :password, :password_confirmation, :adm)
    end
end
