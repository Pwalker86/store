class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  ORDER_OPEN = 'open'
  ORDER_PENDING = 'pending'

  def open?
    status == ORDER_OPEN
  end

  def address1
    shipping_address["address1"]
  end

  def address2
    shipping_address["address2"]
  end

  def city
    shipping_address["city"]
  end

  def state
    shipping_address["state"]
  end

  def postal_code
    shipping_address["postal_code"]
  end
end
