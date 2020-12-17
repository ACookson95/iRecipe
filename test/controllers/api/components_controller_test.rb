require 'test_helper'

class Api::ComponentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_components_index_url
    assert_response :success
  end

  test "should get create" do
    get api_components_create_url
    assert_response :success
  end

  test "should get update" do
    get api_components_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_components_destroy_url
    assert_response :success
  end

end
