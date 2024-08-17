class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    if user_signed_in?
      @orders = current_user.orders #.where.not(status: "open")
    end
  end

  def show

  end

  def create
  end

  def update
  end

  def destroy
  end
end
