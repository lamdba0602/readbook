class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :add_to_basket]

  def index
    @books = Book.published.recent
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to "/"
      flash[:notice] = "提交成功，收到书后我们会及时上架，到时候会通知您哦"
    else
      render :new
    end
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

  private

  def book_params
    params.require(:book).permit(:name, :owner, :category_id, :description)
  end
end

