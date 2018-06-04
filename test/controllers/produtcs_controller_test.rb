require 'test_helper'

class ProdutcsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get produtcs_index_url
    assert_response :success
  end

end
