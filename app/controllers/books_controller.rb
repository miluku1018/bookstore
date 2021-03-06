class BooksController < ApplicationController
before_action :find_book, only: [:show]
  def index
    @books = Book.available
                 .with_attached_cover_image
                 .page(params[:page])
                 .per(4)
    #select * from books
  end

  def show
  end
  
  private
  def find_book
    @book = Book.find(params[:id])
  end
end


