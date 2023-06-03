require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "should have a name" do
    customer = Customer.new
    assert_not customer.save, "Saved the customer without a name"
  end

  test "should have associated purchases" do
    customer = customers(:one)
    assert_equal 2, customer.purchases.count, "Customer should have 2 associated purchases"
  end

end
