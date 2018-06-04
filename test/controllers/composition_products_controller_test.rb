require 'test_helper'

class CompositionProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @composition_product = composition_products(:one)
  end

  test "should get index" do
    get composition_products_url
    assert_response :success
  end

  test "should get new" do
    get new_composition_product_url
    assert_response :success
  end

  test "should create composition_product" do
    assert_difference('CompositionProduct.count') do
      post composition_products_url, params: { composition_product: { cover_id: @composition_product.cover_id, product_id: @composition_product.product_id } }
    end

    assert_redirected_to composition_product_url(CompositionProduct.last)
  end

  test "should show composition_product" do
    get composition_product_url(@composition_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_composition_product_url(@composition_product)
    assert_response :success
  end

  test "should update composition_product" do
    patch composition_product_url(@composition_product), params: { composition_product: { cover_id: @composition_product.cover_id, product_id: @composition_product.product_id } }
    assert_redirected_to composition_product_url(@composition_product)
  end

  test "should destroy composition_product" do
    assert_difference('CompositionProduct.count', -1) do
      delete composition_product_url(@composition_product)
    end

    assert_redirected_to composition_products_url
  end
end
