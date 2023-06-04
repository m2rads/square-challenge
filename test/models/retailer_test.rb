require 'test_helper'

class RetailerTest < ActiveSupport::TestCase
  test "should create a retailer and associate with a customer" do
    retailer = Retailer.new(
      business_name: "Sample Business",
      owner: "John Doe",
      email: "john@example.com",
      phone: "1234567890",
      image_url: "http://example.com/image.png",
      diameter: 10.5,
      coordinate_x: 100.0,
      coordinate_y: 200.0
    )

    retailer2 = Retailer.new(
      business_name: "Sample Business",
      owner: "John Doe2",
      email: "john@example.com",
      phone: "1234567890",
      image_url: "http://example.com/image.png",
      diameter: 10.5,
      coordinate_x: 100.0,
      coordinate_y: 200.0
    )
    assert retailer.save
    assert retailer2.save

    customer = Customer.new(
      name: "Jane",
      last_name: "Doe",
      email: "jane@example.com",
      phone: "9876543210",
      age: 25
    )
    assert customer.save

    purchase = Purchase.new(retailer: retailer, customer: customer)
    purchase2 = Purchase.new(retailer: retailer2, customer: customer)
    assert purchase.save
    assert purchase2.save

    retailers = customer.retailers

    retailers.each do |retailer|
      puts retailer.owner 
    end

    assert_equal retailer, purchase.retailer
    assert_equal customer, purchase.customer
  end
end
