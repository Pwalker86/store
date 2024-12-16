module StoreAdmins
  class OrdersController < ApplicationController
    before_action :authenticate_store_admin!

    def index
      @orders = OrderDecorator.decorate_collection(current_store_admin.store_orders)
    end

    def show
      @order = Order.find(params[:id])
      @scoped_order_items = @order.order_items.find_all { |item| item.product.store_id === current_store_admin.store.id }
    end
  end
end
