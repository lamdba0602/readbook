class Basket < ApplicationRecord
  has_many :basket_items
  has_many :books, :through => :basket_items, :source => :book

  def add_book_to_basket(book)
     bi = basket_items.build
     bi.book = book
     bi.quantity = 1
     bi.save
  end

  def clean!
    basket_items.destroy_all
  end
end
