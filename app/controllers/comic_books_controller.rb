class ComicBooksController < ApplicationController
  def index
    @comics = ComicBook.all
  end
end
