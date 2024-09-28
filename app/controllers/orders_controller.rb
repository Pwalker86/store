class OrdersController < ApplicationController
  before_action :authenticate_user!

  # @return [ActiveRecord::Relation<Order>]
  def index
    if user_signed_in?
      @orders = current_user.orders.where.not(status: "open")
    end
  end

  # @return decorated [Order]
  def show
    @order = Order.find(order_params[:id])
    @order = OrderDecorator.decorate(@order)
  end

  def submit
    @open_order.status = "pending"
    @open_order.order_items.each do |item|
      item.price = item.product.price
      item.save!
    end
    if @open_order.save!
      redirect_to pages_home_path, notice: "Order submitted successfully"
    else
      render @open_order, alert: "Order failed to submit"
    end
  end

  def update
  end

  private

  def order_params
    params.permit(:id)
  end
end
