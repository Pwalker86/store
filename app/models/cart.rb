class Cart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :guest, optional: true
  has_many :cart_items
end
