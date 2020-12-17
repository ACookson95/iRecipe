require 'test_helper'

class Api::CookbooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_cookbooks_index_url
    assert_response :success
  end

  test "should get create" do
    get api_cookbooks_create_url
    assert_response :success
  end

  test "should get update" do
    get api_cookbooks_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_cookbooks_destroy_url
    assert_response :success
  end

end
