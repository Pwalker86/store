class Cart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :guest, optional: true
  has_many :cart_items
  has_many :products, through: :cart_items

  def cart_item_totals
    self.cart_items.sum(:quantity)
  end
end
