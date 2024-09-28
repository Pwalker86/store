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
    @order = OrderDecorator.decorate(Order.find(order_params[:id]))
  end

  def submit
    if OrderSubmitService.new(@open_order).submit
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
