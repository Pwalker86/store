class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # Ensure price_at_submission is set when the order is submitted
  before_save :set_price_at_submission, if: :order_pending?

  def store
    Store.where(products: [ self.product.store ]).first
  end

  private

  def set_price_at_submission
    self.price ||= product.price
  end

  def order_pending?
    order.status == "pending"
  end
end
