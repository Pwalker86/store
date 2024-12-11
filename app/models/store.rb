class Store < ApplicationRecord
  belongs_to :admin
  has_many :products
  has_many :orders

  def store_orders
    Order.where(store_id: id)
  end
end
