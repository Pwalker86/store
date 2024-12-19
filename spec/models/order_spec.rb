require "rails_helper"

RSpec.describe Order, type: :model do
  it "order.open? returns true if order status is open" do
    open_order = Order.create(status: Order::ORDER_OPEN)
    expect(open_order.open?).to eq(true)
  end

    it "Order.destroy throws an exception" do
      o = Order.create()
      expect { o.destroy }.to raise_exception(ActiveRecord::ReadOnlyRecord, "Orders cannot be destroyed")
    end

    it "Order.destroy! throws an exception" do
      o = Order.create()
      expect { o.destroy! }.to raise_exception(ActiveRecord::ReadOnlyRecord, "Orders cannot be destroyed")
    end

  context "shipping address" do
    order = Order.create(shipping_address: {
      address1: "123 Main St",
      address2: "Apt 2",
      city: "Springfield",
      state: "IL",
      postal_code: "62701"
    })
    it "address1 returns the correct value" do
      expect(order.address1).to eq("123 Main St")
    end
    it "address2 returns the correct value" do
      expect(order.address2).to eq("Apt 2")
    end
    it "city returns the correct value" do
      expect(order.city).to eq("Springfield")
    end
    it "state returns the correct value" do
      expect(order.state).to eq("IL")
    end
    it "postal_code returns the correct value" do
      expect(order.postal_code).to eq("62701")
    end
  end
end
