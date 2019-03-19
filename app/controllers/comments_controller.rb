class CommentsController < ApplicationController
  layout 'layout'
  before_action :set_comment, only: [:destroy]

  
  def create
    if user_signed_in? 
      @comment = Comment.new(comments_params)
      if @comment.save
        flash[:notice] = 'Comentário criado com sucesso'
        redirect_to post_path(params[:post_id])
      else
        flash[:noitce] = 'Não foi possível salvar seu comentário'
        redirect_to post_path(params[:post_id])
      end
    else
      flash[:notice] = 'Você precisa estar logado para comentar'
      redirect_to post_path(params[:post_id])
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
