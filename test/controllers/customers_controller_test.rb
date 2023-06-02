require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post customers_url, params: {
        name: "John Doe",
        store_number: "123",
        image_url: "https://example.com/image.jpg"
      }
    end

    assert_redirected_to customer_url(Customer.last)
  end

end
