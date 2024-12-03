class Store < ApplicationRecord
  belongs_to :admin
  has_many :products
  has_many :orders
end
