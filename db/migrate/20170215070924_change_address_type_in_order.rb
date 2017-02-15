class ChangeAddressTypeInOrder < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :address_id, :string
  end
end
