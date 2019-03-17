class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  
  def new
    @post = Post.find(params[:id])
    @comment = Comment.new(post_id: params[:id])
  end

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      flash[:notice] = 'Comentário criado com sucesso'
      redirect_to post_path(params[:post_id])
    else
      flash[:noitce] = 'Não foi possível salvar seu comentário'
      redirect_to post_path(params[:post_id])
    end
  end
  
  def edit
    @comment = Comment.find(params[:comment_id])
  end
  
  def update
    @comment = Comment.find(params[:comment_id])
    if @comment.update(comments_params)
      flash[:notice] = 'Comentário atualizado com sucesso'
      redirect_to posts_path
    else
      flash[:noitce] = 'Não foi possível atualizar o comentário'
      redirect_to posts_path
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = 'Comentário apagado com sucesso'
      redirect_to posts_path
    else
      flash[:notice] = 'Não foi possível apagar o comentário'
      redirect_to posts_path
    end
  end
private
  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
