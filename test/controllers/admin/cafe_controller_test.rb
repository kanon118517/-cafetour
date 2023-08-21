require "test_helper"

class Admin::CafeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cafe_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_cafe_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cafe_edit_url
    assert_response :success
  end
end
