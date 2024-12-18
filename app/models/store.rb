class Store < ApplicationRecord
  belongs_to :store_admin
  has_many :products
  has_many :orders
  has_one_attached :spotlight
end
