module StoreAdmins
  class OrdersController < ApplicationController
    before_action :authenticate_store_admin!

    def index
      @orders = OrderDecorator.decorate_collection(current_store_admin.store_orders)
    end
  end
end
