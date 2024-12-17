class Store < ApplicationRecord
  belongs_to :store_admin
  has_many :products
  has_many :orders
  has_one_attached :spotlight

  def store_orders
    Order.where(store_id: id)
  end
end
