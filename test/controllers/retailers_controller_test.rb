require 'test_helper'

class RetailersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @retailer = retailers(:one)
  end

  test "should get index" do
    get retailers_url
    assert_response :success
  end
  
  test "should get new" do
    get new_retailer_url
    assert_response :success
  end

  test "should create retailer" do
    assert_difference('Retailer.count') do
      post retailers_url, params: { retailer: { business_name: "Test Business", owner: "John Doe", email: "test@example.com", phone: "1234567890", image_url: "http://example.com/image.jpg", diameter: 10.0, coordinate_x: 1.0, coordinate_y: 2.0 } }
    end
  
    assert_response :created
  end
  
  test "should show retailer" do
    get retailer_url(@retailer)
    assert_response :success
  end

  test "should update retailer" do
    patch retailer_url(@retailer), params: { retailer: { business_name: @retailer.business_name, owner: @retailer.owner } }
    assert_response :success
  end

  test "should destroy retailer" do
    assert_difference('Retailer.count', -1) do
      delete retailer_url(@retailer), as: :json
    end
  
    assert_response :success
    assert_equal({ "note" => "Retailer destroyed successfully" }, JSON.parse(response.body))
  end

  test "should create retailer and associated customers" do
    customer_emails = ['customer1@example.com', 'customer2@example.com']
    
    assert_difference('Customer.count', 2) do
      post retailers_url, params: { retailer: { business_name: 'Test Retailer', owner: 'John Doe', email: 'test@example.com', phone: '1234567890', image_url: 'http://example.com/image.jpg', diameter: 10.5, coordinate_x: 0.5, coordinate_y: 0.5 }, customer_emails: customer_emails }, as: :json
    end
    
    assert_response :created
  end
    
end
