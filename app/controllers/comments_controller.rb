class CommentsController < ApplicationController
  layout 'comments'
  before_action :set_comment, only: [:destroy]

  def new
    @comment = Comment.new(post_id: params[:post_id])
  end
  
  def create
    if user_signed_in? 
      @comment = Comment.new(comments_params)
      respond_to do |format|
        if @comment.save
          puts 'batata'
          format.html {
            flash[:notice] = 'Comentário criado com sucesso'
            redirect_to post_path(params[:post_id])
          }
          
          format.js
        else
          format.html {
            flash[:notice] = 'Não foi possível salvar seu comentário'
            redirect_to post_path(params[:post_id])
          }
          format.js
        end
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
  
  def load_comments
    @comments = Comment.where(post_id: params[:post_id])
  end
  
private
  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
