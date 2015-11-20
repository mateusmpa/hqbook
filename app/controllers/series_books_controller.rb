class SeriesBooksController < ApplicationController
  def index
    @series_books = SeriesBook.all
  end

  def show
    @series_book = SeriesBook.find(params[:id])
  end

  def new
    @series_book = SeriesBook.new
  end

  def create
    @series_book = SeriesBook.new(series_book_params)
    if @series_book.save
      redirect_to @series_book
    else
      render 'new'
    end
  end

  private

  def series_book_params
    params.require(:series_book).permit(:title,
                                        :publisher,
                                        :review,
                                        :year,
                                        :editions_number,
                                        :image)
  end
end
