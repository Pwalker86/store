class AddStoreToOrders < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :store, null: false, foreign_key: true, default: 1
  end
end