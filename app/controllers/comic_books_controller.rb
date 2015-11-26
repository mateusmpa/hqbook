class ComicBooksController < ApplicationController
  def show
    @comic = ComicBook.find(params[:id])
    @like = @comic.likes.find_by(user: current_user)
    @comment = Comment.new(commentable: @comic)
  end
end
