class OrdersController < ApplicationController
  # @return [ActiveRecord::Relation<Order>]
  def index
    if @active_user
      @orders = OrderDecorator.decorate_collection(@active_user.orders.includes([:user]).where.not(status: Order::ORDER_OPEN))
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
    if OrderSubmitService.new(@order, order_address_params).submit
      # Clear guest session. If the user needs to view their order,
      # they'll see it on the confirmation page or from the order id we provide them in an email
      session[:guest_id] = nil
      redirect_to order_confirmation_path(@order), notice: "Order submitted successfully"
    else
      render @open_order, alert: "Order failed to submit"
    end
  end

  def confirmation
    @order = OrderDecorator.decorate(Order.find(order_params[:order_id]))
  end

  def update
  end

  private

  def ensure_active_user
    redirect_to root_path, alert: "Cannot find user" unless @active_user
  end

  def order_params
    params.permit(:id, :order_id)
  end

  def order_submit_params
    params.require(:order).permit(:order_id)
  end

  def order_address_params
    params.require(:order).permit(:address1, :address2, :city, :state, :postal_code, :email)
  end
end
