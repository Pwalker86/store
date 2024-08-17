class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @order_item = @order.order_items.find_or_create_by(product: @product)
    @order_item.quantity += params[:qty].to_i

    if @order_item.save
      redirect_to @order, notice: 'Product was successfully added to your order.'
    else
      redirect_to @order, alert: 'There was an error adding the product to your order.'
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @order_item = @order.order_items.find_by(product: @product)
    if @order_item
      # TODO: if quantity will go to 0, destroy the order_item
      @order_item.quantity += params[:qty].to_i

      if @order_item.save!
        redirect_to @order, notice: 'Quantity was successfully updated.'
      else
        redirect_to @order, alert: 'There was an error adding the product to your order.'
      end
    else
      redirect_to @order, alert: 'There was an error adding the product to your order.'
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
