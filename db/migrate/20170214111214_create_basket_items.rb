class CreateBasketItems < ActiveRecord::Migration[5.0]
  def change
    create_table :basket_items do |t|
      t.integer :basket_id
      t.integer :book_id
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
