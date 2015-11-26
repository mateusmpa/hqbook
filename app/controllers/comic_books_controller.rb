class ComicBooksController < ApplicationController
  def show
    @comic = ComicBook.find(params[:id])
    @comment = Comment.new(commentable: @comic)
  end
end
