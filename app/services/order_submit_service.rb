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
    set_guest_email
    update_status
    set_sales_prices
    set_order_address
    @order.save!
  end

  private

  # Updates the status of the order to 'pending'. After this, the order will be sent to fulfillment.
  def update_status
    @order.status = "pending"
  end

  # Sets the price of each order item to the price of the product at the time of sale.
  def set_sales_prices
    @order.order_items.each do |item|
      item.price = item.product.price
    end
  end

   # Sets the shipping address for the order.
   def set_order_address
     @order.shipping_address = {
       address1: @address_params[:address1],
       address2: @address_params[:address2],
       city: @address_params[:city],
       state: @address_params[:state],
       postal_code: @address_params[:postal_code]
     }
   end

   # If the order has a guest user, it updates the guest's email
   # with the provided email from the address parameters and saves the guest user.
   def set_guest_email
     if @order.guest.present?
       @order.guest.email = @address_params[:email]
       @order.guest.save!
     end
   end

end
