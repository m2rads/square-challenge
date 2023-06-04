require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test 'should get index' do
    get :index, format: :json
    assert_response :success
    assert_equal Customer.all.to_json, response.body
  end

  test 'should show customer' do
    get :show, params: { id: @customer.id }, format: :json
    assert_response :success
    assert_equal @customer.to_json, response.body
  end

  test 'should create customer' do
    assert_difference('Customer.count') do
      post :create, params: { customer: { name: 'John', last_name: 'Doe', email: 'john.doe@example.com', phone: '123456789', age: 30 } }, format: :json
    end
    assert_response :created
    assert_equal 'John', Customer.last.name
  end

  test 'should update customer' do
    patch :update, params: { id: @customer.id, customer: { name: 'Updated Name' } }, format: :json
    assert_response :success
    @customer.reload
    assert_equal 'Updated Name', @customer.name
  end

  test 'should destroy customer' do
    assert_difference('Customer.count', -1) do
      delete :destroy, params: { id: @customer.id }, format: :json
    end
    assert_response :success
    assert_equal({ note: 'Customer destroyed successfully' }.to_json, response.body)
  end

  test 'should get associated retailers' do
    get :associated_retailers, params: { id: @customer.id }, format: :json
    assert_response :success
    puts response.body
  end
end
