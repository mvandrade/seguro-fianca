require 'test_helper'

class Location::CoversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_cover = location_covers(:one)
  end

  test "should get index" do
    get location_covers_url
    assert_response :success
  end

  test "should get new" do
    get new_location_cover_url
    assert_response :success
  end

  test "should create location_cover" do
    assert_difference('Location::Cover.count') do
      post location_covers_url, params: { location_cover: { code: @location_cover.code } }
    end

    assert_redirected_to location_cover_url(Location::Cover.last)
  end

  test "should show location_cover" do
    get location_cover_url(@location_cover)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_cover_url(@location_cover)
    assert_response :success
  end

  test "should update location_cover" do
    patch location_cover_url(@location_cover), params: { location_cover: { code: @location_cover.code } }
    assert_redirected_to location_cover_url(@location_cover)
  end

  test "should destroy location_cover" do
    assert_difference('Location::Cover.count', -1) do
      delete location_cover_url(@location_cover)
    end

    assert_redirected_to location_covers_url
  end
end
