class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @order_item = @open_order.order_items.find_or_create_by(product: @product)
    @order_item.quantity += params[:qty].to_i

    if @order_item.save
      redirect_to @open_order, notice: 'Product was successfully added to your order.'
    else
      redirect_to @open_order, alert: 'There was an error adding the product to your order.'
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @order_item = @open_order.order_items.find_or_initialize_by(product: @product)
    @order_item.quantity += params[:qty].to_i

    if @order_item.quantity <= 0
      @order_item.destroy
      redirect_to @open_order, notice: 'Product was successfully removed from your order.'
    elsif @order_item.save
      redirect_to @open_order, notice: 'Quantity was successfully updated.'
    else
      redirect_to @open_order, alert: 'There was an error updating the product quantity.'
    end
  end

  def destroy
    if @order.order_items.find(params[:id]).destroy
      redirect_to @order, notice: 'Product was successfully removed from your order.'
    else
      redirect_to @order, alert: 'There was an error removing the product from your order.'
    end
  end
end
