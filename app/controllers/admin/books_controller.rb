class Admin::BooksController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
  
    if @book.update(book_params)
      redirect_to admin_books_path, notice: "Update succeed"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy
    redirect_to admin_books_path, alert: "Delete book"
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to admin_books_path
    else
      render :new
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:name, :owner, :category_id, :image, :description, :quantity, :status)
  end
end
