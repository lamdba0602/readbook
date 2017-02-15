class ChangeAddressNameInOrder < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :address_id, :address
  end
end
