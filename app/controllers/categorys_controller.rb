class CategorysController < ApplicationController

  def show
    @category = Category.find_by_name(params[:id])
    @books = @category.books
  end

end
