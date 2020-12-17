require 'test_helper'

class Api::IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_ingredients_index_url
    assert_response :success
  end

  test "should get create" do
    get api_ingredients_create_url
    assert_response :success
  end

  test "should get update" do
    get api_ingredients_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_ingredients_destroy_url
    assert_response :success
  end

end
