class CartDecorator < Draper::Decorator
  delegate_all

  # Sorts the items here. Otherwise, the order changes every time an item is added.
  def sorted_cart_items
    object.cart_items.includes(:product).order("products.name")
  end

  def total_price
    object.cart_items.includes(:product).sum { |item| item.price * item.quantity }
  end

  def cart_item_totals
    object.cart_items.sum(:quantity)
  end
  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
