class ComentarioAutenticadosController < ApplicationController
  before_action :set_comentario_autenticado, only: [:show, :edit, :update, :destroy]

  # GET /comentario_autenticados
  # GET /comentario_autenticados.json
  def index
    @comentario_autenticados = ComentarioAutenticado.all
  end

  # GET /comentario_autenticados/1
  # GET /comentario_autenticados/1.json
  def show
  end

  # GET /comentario_autenticados/new
  def new
    @comentario_autenticado = ComentarioAutenticado.new
  end

  # GET /comentario_autenticados/1/edit
  def edit
  end

  # POST /comentario_autenticados
  # POST /comentario_autenticados.json
  def create
    @comentario_autenticado = ComentarioAutenticado.new(comentario_autenticado_params)
    #@comentario_autenticado.autor = current_user.nome_completo
    #@comentario_autenticado.usuario = current_user

    respond_to do |format|
      if @comentario_autenticado.save
        format.html { redirect_to @comentario_autenticado, notice: 'Comentario autenticado was successfully created.' }
        format.json { render :show, status: :created, location: @comentario_autenticado }
      else
        format.html { render :new }
        format.json { render json: @comentario_autenticado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentario_autenticados/1
  # PATCH/PUT /comentario_autenticados/1.json
  def update
    respond_to do |format|
      if @comentario_autenticado.update(comentario_autenticado_params)
        format.html { redirect_to @comentario_autenticado, notice: 'Comentario autenticado was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario_autenticado }
      else
        format.html { render :edit }
        format.json { render json: @comentario_autenticado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentario_autenticados/1
  # DELETE /comentario_autenticados/1.json
  def destroy
    @comentario_autenticado.destroy
    respond_to do |format|
      format.html { redirect_to comentario_autenticados_url, notice: 'Comentario autenticado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario_autenticado
      @comentario_autenticado = ComentarioAutenticado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_autenticado_params
      params.require(:comentario_autenticado).permit(:comentario_id, :usuario_id)
    end
end
