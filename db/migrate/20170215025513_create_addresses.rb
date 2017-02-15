class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :real_name
      t.string :phone_number
      t.string :address_info

      t.timestamps
    end
  end
end
