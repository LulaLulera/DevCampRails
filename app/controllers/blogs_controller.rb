class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "blog" #define el layout que quiere implementar para este controlador, y no cogerá ningún otro.
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, site_admin: :all #gestión de roles petergate

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.page(params[:page]).per(5)
    @page_title = "My Portfolio blog"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog creado correctamente.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog actualizado correctamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    #byebug  => esto permite un debug en el código, podemos hacerle preguntas, por ejemplo escribir params, y nos dirá los parámetros que tiene, o hacer querys incluso
    
    if @blog.draft?
      @blog.published! 
    elsif @blog.published?
      @blog.draft!
    end
    redirect_to blogs_url, notice: 'Post status has been updated.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
      #con el friendly lo que hacermos es sobreescribir el comportamiento para que busque por el friendly id en vez de por el id
    end

    # Only allow a list of trusted parameters through. White list
    def blog_params
      params.require(:blog).permit(:title, 
                                   :body)
    end
end
