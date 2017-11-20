require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get adduser" do
    get user_adduser_url
    assert_response :success
  end

end
