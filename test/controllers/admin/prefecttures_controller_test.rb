require "test_helper"

class Admin::PrefectturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_prefecttures_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_prefecttures_index_url
    assert_response :success
  end
end
