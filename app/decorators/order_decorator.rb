class OrderDecorator < Draper::Decorator
  delegate_all

  # gives a single point to determine the user entity of an order.
  def user_entity
    if object.guest.nil?
      object.user
    elsif object.user.nil?
      object.guest
    end
  end

  # Sorts the items here. Otherwise, the order changes every time an item is added.
  def sorted_order_items
    object.order_items.includes(:product).order("products.name")
  end

  def total_price
    object.order_items.includes(:product).sum { |item| item.product.price * item.quantity }
  end

  def order_item_totals
    object.order_items.sum(:quantity)
  end

  def is_ready_for_checkout
    object.status == Order::ORDER_OPEN && object.order_items.any?
  end
end
