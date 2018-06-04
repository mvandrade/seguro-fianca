require 'test_helper'

class Location::CompositionProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_composition_product = location_composition_products(:one)
  end

  test "should get index" do
    get location_composition_products_url
    assert_response :success
  end

  test "should get new" do
    get new_location_composition_product_url
    assert_response :success
  end

  test "should create location_composition_product" do
    assert_difference('Location::CompositionProduct.count') do
      post location_composition_products_url, params: { location_composition_product: { branches_id: @location_composition_product.branches_id, products_id: @location_composition_product.products_id } }
    end

    assert_redirected_to location_composition_product_url(Location::CompositionProduct.last)
  end

  test "should show location_composition_product" do
    get location_composition_product_url(@location_composition_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_composition_product_url(@location_composition_product)
    assert_response :success
  end

  test "should update location_composition_product" do
    patch location_composition_product_url(@location_composition_product), params: { location_composition_product: { branches_id: @location_composition_product.branches_id, products_id: @location_composition_product.products_id } }
    assert_redirected_to location_composition_product_url(@location_composition_product)
  end

  test "should destroy location_composition_product" do
    assert_difference('Location::CompositionProduct.count', -1) do
      delete location_composition_product_url(@location_composition_product)
    end

    assert_redirected_to location_composition_products_url
  end
end
