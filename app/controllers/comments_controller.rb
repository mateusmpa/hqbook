class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    if comment.save
      model = comment_params[:commentable_type]
        .constantize.find(comment_params[:commentable_id])
      redirect_to model
    else
      flash[:error] = 'Descrição do comentário é obrigatório'
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment)
      .permit(:description, :commentable_id, :commentable_type)
  end
end
