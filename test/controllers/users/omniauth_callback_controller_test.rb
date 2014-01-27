require 'test_helper'

class Users::OmniauthCallbackControllerTest < ActionController::TestCase
  test "should get twitter" do
    get :twitter
    assert_response :success
  end

end
