class CartsController < ApplicationController
  def show
  end

  def edit
  end

  def update
    user_entity_class = params[:user_entity].constantize
    @cart = user_entity_class.find(params[:user_id]).cart
    @product = Product.find(params[:product_id])
    cart_item = @cart.cart_items.find_or_initialize_by(product: @product)
    cart_item.increment(:quantity, params[:quantity].to_i)
    # @product = Product.find(order_item_params[:order_item][:product_id])
    # # Use find_or_initialize_by so that if the order item already exists on the order,
    # # it will update the quantity instead of creating a new order item.
    # @order_item = @open_order.order_items.find_or_initialize_by(product: @product)
    # @order_item.increment(:quantity, order_item_params[:order_item][:quantity].to_i)
    #
    if cart_item.quantity <= 0
      cart_item.destroy
      redirect_to user_cart_path, notice: "Product was successfully removed from your order."
    elsif cart_item.save
      redirect_to user_cart_path, notice: "Quantity was successfully updated."
    else
      redirect_to user_cart_path, alert: "There was an error updating the product quantity."
    end
  end

  def destroy
  end
end
