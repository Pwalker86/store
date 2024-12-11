class Guest < ApplicationRecord
  has_many :orders
  has_one :cart
end
