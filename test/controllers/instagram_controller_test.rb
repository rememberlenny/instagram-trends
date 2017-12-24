require 'test_helper'

class InstagramControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get instagram_login_url
    assert_response :success
  end

  test "should get store_session" do
    get instagram_store_session_url
    assert_response :success
  end

end
