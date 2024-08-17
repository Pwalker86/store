class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @order_item = @order.order_items.create(product: @product)

    if @order_item.save
      redirect_to @product, notice: 'Product was successfully added to your order.'
    else
      redirect_to @product, alert: 'There was an error adding the product to your order.'
    end  end

  def update
  end

  def destroy
    if @order.order_items.find(params[:id]).destroy
      redirect_to @order, notice: 'Product was successfully removed from your order.'
    else
      redirect_to @order, alert: 'There was an error removing the product from your order.'
    end
  end
end
