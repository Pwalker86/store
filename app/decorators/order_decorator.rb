class OrderDecorator < Draper::Decorator
  delegate_all

  def sorted_order_items
    object.order_items.includes(:product).order("products.name")
  end

  def total_price
    object.order_items.includes(:product).sum { |item| item.product.price * item.quantity }
  end

  def order_item_totals
    object.order_items.sum(:quantity)
  end
end
