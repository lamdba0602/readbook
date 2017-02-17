class ChangeStatusDefaultToBook < ActiveRecord::Migration[5.0]
  def change
    change_column :books, :status, :boolean, :default => false
  end
end
