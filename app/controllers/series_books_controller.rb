class SeriesBooksController < ApplicationController
  def index
    @series_books = SeriesBook.all
  end

  def show
    @series_book = SeriesBook.find(params[:id])
    @like = @series_book.likes.find_by(user: current_user)
  end
end
