class RenameAdressToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :places, :adress, :address
  end
end
