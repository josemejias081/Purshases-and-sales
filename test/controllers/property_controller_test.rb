require "test_helper"

class PropertyControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get property_new_url
    assert_response :success
  end

  test "should get show" do
    get property_show_url
    assert_response :success
  end

  test "should get index" do
    get property_index_url
    assert_response :success
  end

  test "should get edit" do
    get property_edit_url
    assert_response :success
  end

  test "should get create" do
    get property_create_url
    assert_response :success
  end

  test "should get update" do
    get property_update_url
    assert_response :success
  end

  test "should get destroy" do
    get property_destroy_url
    assert_response :success
  end

  test "should get set_property" do
    get property_set_property_url
    assert_response :success
  end

  test "should get propety_params" do
    get property_propety_params_url
    assert_response :success
  end
end
