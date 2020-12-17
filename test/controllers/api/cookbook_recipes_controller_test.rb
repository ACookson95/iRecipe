require 'test_helper'

class Api::CookbookRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_cookbook_recipes_index_url
    assert_response :success
  end

  test "should get create" do
    get api_cookbook_recipes_create_url
    assert_response :success
  end

  test "should get update" do
    get api_cookbook_recipes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_cookbook_recipes_destroy_url
    assert_response :success
  end

end
