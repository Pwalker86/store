class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  # Ensure price_at_submission is set when the order is submitted
  before_save :set_price, if: :order_pending?

  private

  def set_price
    self.price ||= product.price
  end

  def order_pending?
    order.status == "pending"
  end
end
