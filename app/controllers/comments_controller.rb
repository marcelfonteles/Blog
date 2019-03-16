class CommentsController < ApplicationController
  before_action :set_comment, only: []
  
  def new
    @comment = Comment.new(post_id: params[:id])
  end

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      flash[:notice] = 'Comentário criado com sucesso'
      redirect_to posts_path
    else
      flash[:noitce] = 'Não foi possível salvar seu comentário'
      redirect_to posts_path
    end
  end
  
  def edit
  end

  def destroy
  end
private
  def comments_params
    params.require(:comment).permit(:content, :post_id)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
