class RemoveStoreIdFromOrder < ActiveRecord::Migration[8.0]
  # TODO: This might not be needed.
  def change
    # remove_foreign_key :orders, :stores
    # remove_column :orders, :store_id, :integer
  end
end
