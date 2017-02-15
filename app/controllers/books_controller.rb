class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_to_basket
    @book = Book.find(params[:id])
   if !current_basket.books.include?(@book)
     current_basket.add_book_to_basket(@book)
     flash[:notice] = "你已成功将 #{@book.name} 加入购物车"
   else
     flash[:warning] = "你的购物车内已有此物品"
   end
    redirect_to :back
  end
end
