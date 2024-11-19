require "test_helper"

class OrderDecoratorTest < Draper::TestCase
  test "is_ready_for_checkout" do
    orders(:order_one)
  end
end
