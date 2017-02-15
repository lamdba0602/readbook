class CreateBookLists < ActiveRecord::Migration[5.0]
  def change
    create_table :book_lists do |t|
      t.integer :order_id
      t.string :book_name
      t.integer :book_price
      t.integer :quantity
      t.timestamps
    end
  end
end
