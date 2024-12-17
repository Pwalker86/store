class RemoveUserAndGuestFromOrders < ActiveRecord::Migration[8.0]
  def change
    remove_reference :orders, :user, index: true, foreign_key: true
    remove_reference :orders, :guest, index: true, foreign_key: true
  end
end
