require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get after_sign_up_path_for" do
    get registrations_after_sign_up_path_for_url
    assert_response :success
  end

end
