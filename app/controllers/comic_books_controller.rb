class ComicBooksController < ApplicationController
  def index
    @comics = ComicBook.all
  end

  def show
    @comic = ComicBook.find(params[:id])
  end
end
