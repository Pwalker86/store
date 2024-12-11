class RemoveStoreIdFromOrder < ActiveRecord::Migration[8.0]
  def change
    remove_foreign_key :orders, :stores
    remove_column :orders, :store_id, :integer
  end
end
