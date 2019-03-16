class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = 'Post criado com sucesso'
    else
      flash[:notice] = 'Não foi possível salvar a postagem'
      render 'new'
    end
  end

  def update
    #render plain: params[:post].inspect
    if @post.update(posts_params)
      flash[:notice] = 'Postagem atualizada com sucesso'
      redirect_to posts_path
    else
      flash[:notice] = 'Não foi possível atualizar a postagem'
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Postagem apagado com sucesso'
      redirect_to posts_path
    else
      flash[:notice] = 'Não foi possível apagar a postagem'
      redirect_to posts_path
    end
  end
  
  private
    def posts_params
      params.require(:post).permit(:title, :content)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
end
