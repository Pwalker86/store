class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where.not(status: "open")
  end

  def create
  end

  def update
  end

  def destroy
  end
end
