class PostsController < ApplicationController
  layout :resolve_layout

  
  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_admin!, only: [:new, :create, :update, :edit, :destroy]
  def index
    @posts = Post.all.order('created_at DESC')
  end
  
  def show
    @comment = Comment.new(post_id: @post.id)
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
    
    # Definir qual layout será utilizado dependendo da action
    def resolve_layout
      case action_name
        when 'new', 'edit'
          'dashboard'
        else
          'layout'
      end
    end
end
