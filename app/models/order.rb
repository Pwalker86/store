class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  def sorted_order_items
    order_items.includes(:product).order("products.name")
  end
  def order_item_totals
    order_items.sum(:quantity)
  end
end
