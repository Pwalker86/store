# Handles the user submitting ("checking out") an order.
# sets status to 'pending' and saves the order_items' prices as they were at time of sale.
# payment processing would be invoked here in the future.
#
class OrderSubmitService
  def initialize(order, address_params)
    @order = order
    @address_params = address_params
  end

  def submit
    update_status
    set_sales_prices
    set_order_address
    @order.save!
  end

  private

  def update_status
    @order.status = "pending"
  end

  def set_sales_prices
    @order.order_items.each do |item|
      item.price = item.product.price
    end
  end

  def set_order_address
    @order.shipping_address = {
      address1: @address_params[:address1],
      address2: @address_params[:address2],
      city: @address_params[:city],
      state: @address_params[:state],
      postal_code: @address_params[:postal_code]
    }
  end

end
