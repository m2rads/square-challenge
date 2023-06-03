require 'test_helper'

class RetailerTest < ActiveSupport::TestCase
  test "should have a name" do
    retailer = Retailer.new
    assert_not retailer.save, "Saved the retailer without a name"
  end

  test "should have associated purchases" do
    retailer = retailers(:one)
    assert_equal 3, retailer.purchases.count, "Retailer should have 3 associated purchases"
  end

  # Add more tests as needed
end
