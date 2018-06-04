require 'test_helper'

class Location::BranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_branch = location_branches(:one)
  end

  test "should get index" do
    get location_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_location_branch_url
    assert_response :success
  end

  test "should create location_branch" do
    assert_difference('Location::Branch.count') do
      post location_branches_url, params: { location_branch: { code: @location_branch.code } }
    end

    assert_redirected_to location_branch_url(Location::Branch.last)
  end

  test "should show location_branch" do
    get location_branch_url(@location_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_branch_url(@location_branch)
    assert_response :success
  end

  test "should update location_branch" do
    patch location_branch_url(@location_branch), params: { location_branch: { code: @location_branch.code } }
    assert_redirected_to location_branch_url(@location_branch)
  end

  test "should destroy location_branch" do
    assert_difference('Location::Branch.count', -1) do
      delete location_branch_url(@location_branch)
    end

    assert_redirected_to location_branches_url
  end
end
