require 'test_helper'

class SquareControllerTest < ActionController::TestCase
  test "should get authorization_url" do
    get :authorization_url
    assert_response :success
    assert_not_nil assigns(:authorization_url)
  end

  test "should get callback" do
    authorization_code = "12345" # Replace with a valid authorization code

    post :callback, params: { code: authorization_code }
    assert_response :success
    assert_not_nil assigns(:access_token)
  end
end
