class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_to_basket
    @book = Book.find(params[:id])
    current_basket.add_book_to_basket(@book)
    flash[:notice] = "成功加入漂流瓶"
    redirect_to :back
  end
end
