class CategoriaPostsController < ApplicationController
  before_action :set_categoria_post, only: [:show, :edit, :update, :destroy]

  # GET /categoria_posts
  # GET /categoria_posts.json
  def index
    @categoria_posts = CategoriaPost.all
  end

  # GET /categoria_posts/1
  # GET /categoria_posts/1.json
  def show
  end

  # GET /categoria_posts/new
  def new
    @categoria_post = CategoriaPost.new
  end

  # GET /categoria_posts/1/edit
  def edit
  end

  # POST /categoria_posts
  # POST /categoria_posts.json
  def create
    @categoria_post = CategoriaPost.new(categoria_post_params)
    @categoria =  Categoria.find(params[:categoria_id])
    @post =  Post.find(params[:post_id])
    @categoria_post.post = @post
    @categoria_post.categoria = @categoria

    respond_to do |format|
      if @categoria_post.save
        format.html { redirect_to @post, notice: 'As categorias foram adicionadas ao post.' }
        format.json { render :show, status: :created, location: @categoria_post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria_posts/1
  # PATCH/PUT /categoria_posts/1.json
  def update
    respond_to do |format|
      if @categoria_post.update(categoria_post_params)
        format.html { redirect_to @categoria_post, notice: 'Categoria post was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoria_post }
      else
        format.html { render :edit }
        format.json { render json: @categoria_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria_posts/1
  # DELETE /categoria_posts/1.json
  def destroy
    @categoria_post.destroy
    respond_to do |format|
      format.html { redirect_to categoria_posts_url, notice: 'Categoria post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria_post
      @categoria_post = CategoriaPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_post_params
      params.require(:categoria_post).permit(:categoria_id, :post_id)
    end
end
