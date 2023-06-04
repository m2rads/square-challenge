require 'test_helper'

class SquareControllerTest < ActionController::TestCase
  test 'should get authorization_url' do
    get :authorization_url
    assert_response :success
    # Add additional assertions as needed
  end

  test 'should get callback' do
    # Simulate the callback request with the authorization code
    code = '12345'
    get :callback, params: { code: code }
    assert_redirected_to retailer_dashboard_path
    assert_equal 'Square account linked successfully!', flash[:success]
    # Add additional assertions as needed
  end
end
