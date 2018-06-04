require 'test_helper'

class Location::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get location_dashboard_index_url
    assert_response :success
  end

end
