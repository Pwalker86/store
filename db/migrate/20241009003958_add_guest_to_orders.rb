class AddGuestToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :guest, null: true, foreign_key: true
  end
end
