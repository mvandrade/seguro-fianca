require 'test_helper'

class GroupBranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_branch = group_branches(:one)
  end

  test "should get index" do
    get group_branches_url
    assert_response :success
  end

  test "should get new" do
    get new_group_branch_url
    assert_response :success
  end

  test "should create group_branch" do
    assert_difference('GroupBranch.count') do
      post group_branches_url, params: { group_branch: { description: @group_branch.description, string: @group_branch.string } }
    end

    assert_redirected_to group_branch_url(GroupBranch.last)
  end

  test "should show group_branch" do
    get group_branch_url(@group_branch)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_branch_url(@group_branch)
    assert_response :success
  end

  test "should update group_branch" do
    patch group_branch_url(@group_branch), params: { group_branch: { description: @group_branch.description, string: @group_branch.string } }
    assert_redirected_to group_branch_url(@group_branch)
  end

  test "should destroy group_branch" do
    assert_difference('GroupBranch.count', -1) do
      delete group_branch_url(@group_branch)
    end

    assert_redirected_to group_branches_url
  end
end
