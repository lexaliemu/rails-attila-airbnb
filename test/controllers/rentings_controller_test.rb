require 'test_helper'

class RentingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rentings_index_url
    assert_response :success
  end

  test "should get show" do
    get rentings_show_url
    assert_response :success
  end

  test "should get new" do
    get rentings_new_url
    assert_response :success
  end

  test "should get create" do
    get rentings_create_url
    assert_response :success
  end

end
