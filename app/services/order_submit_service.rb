# Handles the user submitting ("checking out") an order.
# sets status to 'pending' and saves the order_items' prices as they were at time of sale.
# payment processing would be invoked here in the future.
#
class OrderSubmitService
  def initialize(order)
    @order = order
  end

  def submit
    update_status
    set_sales_prices
    @order.save!
  end

  private

  def update_status
    @order.status = "pending"
  end

  def set_sales_prices
    @order.order_items.each do |item|
      item.price = item.product.price
      item.save!
    end
  end
end

