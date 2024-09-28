class OrderProcessService
  def initialize(order)
    @order = order
  end

  def process
    @open_order.status = "pending"
    @open_order.order_items.each do |item|
      item.price = item.product.price
      item.save!
    end
  end
end
