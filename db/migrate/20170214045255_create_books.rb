class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :owner
      t.integer :category_id
      t.text :description
      t.boolean :status
      t.integer :quantity

      t.timestamps
    end
  end
end
