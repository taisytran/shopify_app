require 'test_helper'

class ProductManagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_management = product_managements(:one)
  end

  test "should get index" do
    get product_managements_url
    assert_response :success
  end

  test "should get new" do
    get new_product_management_url
    assert_response :success
  end

  test "should create product_management" do
    assert_difference('ProductManagement.count') do
      post product_managements_url, params: { product_management: {  } }
    end

    assert_redirected_to product_management_url(ProductManagement.last)
  end

  test "should show product_management" do
    get product_management_url(@product_management)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_management_url(@product_management)
    assert_response :success
  end

  test "should update product_management" do
    patch product_management_url(@product_management), params: { product_management: {  } }
    assert_redirected_to product_management_url(@product_management)
  end

  test "should destroy product_management" do
    assert_difference('ProductManagement.count', -1) do
      delete product_management_url(@product_management)
    end

    assert_redirected_to product_managements_url
  end
end
