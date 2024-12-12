class Cart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :guest, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
end
