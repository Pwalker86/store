class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_one :store

  def store_orders
    Order.joins(order_items: { product: :store }).where(stores: { admin_id: id }).distinct
  end
end
