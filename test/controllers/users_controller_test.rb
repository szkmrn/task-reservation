require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get acount" do
    get users_acount_url
    assert_response :success
  end

  test "should get plofile" do
    get users_plofile_url
    assert_response :success
  end
end
