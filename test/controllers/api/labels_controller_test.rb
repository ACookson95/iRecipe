require 'test_helper'

class Api::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_labels_index_url
    assert_response :success
  end

  test "should get create" do
    get api_labels_create_url
    assert_response :success
  end

  test "should get update" do
    get api_labels_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_labels_destroy_url
    assert_response :success
  end

end
