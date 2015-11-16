class SeriesBooksController < ApplicationController
  def index
    @series_books = SeriesBook.all
  end

  def show
    @series_book = SeriesBook.find(params[:id])
  end
end
