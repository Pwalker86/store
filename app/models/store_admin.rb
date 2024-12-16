class StoreAdmin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_one :store

  def store_orders
    Order.joins(order_items: { product: :store }).where(stores: { store_admin_id: id }).distinct
  end
end
