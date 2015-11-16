class ComicBooksController < ApplicationController
  def show
    @comic = ComicBook.find(params[:id])
    @comment = Comment.new(commentable: @comic)
    @comments = Comment.where(commentable: @comic)
  end
end
