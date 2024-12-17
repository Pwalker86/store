class AddOrderableToOrders < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :orderable, polymorphic: true, index: true
  end
end
