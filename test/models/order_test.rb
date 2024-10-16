require "test_helper"

class OrderTest < ActiveSupport::TestCase
  fixtures :orders

  test 'open?' do
    open_order = orders(:order_two)
    assert_equal true, open_order.open?
  end

  test 'address1' do
    order = orders(:order_one)
    assert_equal '123 Main St', order.address1
  end
end
