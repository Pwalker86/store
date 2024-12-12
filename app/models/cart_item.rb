class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  before_save :set_price_at_submission # if: :order_pending?

  private

  def set_price_at_submission
    self.price ||= product.price
  end

  # def order_pending?
  #   order.status == "pending"
  # end
end
