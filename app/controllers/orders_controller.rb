class OrdersController < ApplicationController
  before_action :authenticate_user!

  # @return [ActiveRecord::Relation<Order>]
  def index
    if user_signed_in?
      @orders = current_user.orders.where.not(status: Order::ORDER_OPEN)
    end
  end

  # @return decorated [Order]
  def show
    @order = OrderDecorator.decorate(Order.find(order_params[:id]))
  end

  def checkout
    @order = OrderDecorator.decorate(Order.find(order_params[:order_id]))
  end

  def submit
    @order = Order.find(order_submit_params[:order_id])
    if OrderSubmitService.new(@open_order, order_address_params).submit
      redirect_to pages_home_path, notice: "Order submitted successfully"
    else
      render @open_order, alert: "Order failed to submit"
    end
  end

  def update
  end

  private

  def order_params
    params.permit(:id, :order_id)
  end

  def order_submit_params
    params.require(:order).permit(:order_id)
  end

  def order_address_params
    params.require(:order).permit(:address1, :address2, :city, :state, :postal_code)
  end
end
