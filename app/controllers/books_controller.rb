class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_to_basket
    @book = Book.find(params[:id])
    redirect_to :back
    flash[:notice] = "测试加入书篮"
  end
end
