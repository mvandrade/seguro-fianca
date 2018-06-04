require 'test_helper'

class Location::GroupBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_group_branch = location_group_branches(:one)
  end

  test "should get index" do
    get location_group_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_location_group_branch_url
    assert_response :success
  end

  test "should create location_group_branch" do
    assert_difference('Location::GroupBranch.count') do
      post location_group_branches_url, params: { location_group_branch: { code: @location_group_branch.code, description: @location_group_branch.description } }
    end

    assert_redirected_to location_group_branch_url(Location::GroupBranch.last)
  end

  test "should show location_group_branch" do
    get location_group_branch_url(@location_group_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_group_branch_url(@location_group_branch)
    assert_response :success
  end

  test "should update location_group_branch" do
    patch location_group_branch_url(@location_group_branch), params: { location_group_branch: { code: @location_group_branch.code, description: @location_group_branch.description } }
    assert_redirected_to location_group_branch_url(@location_group_branch)
  end

  test "should destroy location_group_branch" do
    assert_difference('Location::GroupBranch.count', -1) do
      delete location_group_branch_url(@location_group_branch)
    end

    assert_redirected_to location_group_branches_url
  end
end
