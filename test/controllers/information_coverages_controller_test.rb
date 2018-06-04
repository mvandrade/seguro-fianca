require 'test_helper'

class InformationCoveragesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @information_coverage = information_coverages(:one)
  end

  test "should get index" do
    get information_coverages_url
    assert_response :success
  end

  test "should get new" do
    get new_information_coverage_url
    assert_response :success
  end

  test "should create information_coverage" do
    assert_difference('InformationCoverage.count') do
      post information_coverages_url, params: { information_coverage: { composition_product_id: @information_coverage.composition_product_id, compulsory_coverage: @information_coverage.compulsory_coverage, date_status: @information_coverage.date_status, description_franchise: @information_coverage.description_franchise, final_term: @information_coverage.final_term, maximum_reference: @information_coverage.maximum_reference, maximun_importance_value: @information_coverage.maximun_importance_value, minimum_premium_reference: @information_coverage.minimum_premium_reference, minimum_reference: @information_coverage.minimum_reference, munimum_importance_value: @information_coverage.munimum_importance_value, status: @information_coverage.status, type_coverage: @information_coverage.type_coverage, validity: @information_coverage.validity } }
    end

    assert_redirected_to information_coverage_url(InformationCoverage.last)
  end

  test "should show information_coverage" do
    get information_coverage_url(@information_coverage)
    assert_response :success
  end

  test "should get edit" do
    get edit_information_coverage_url(@information_coverage)
    assert_response :success
  end

  test "should update information_coverage" do
    patch information_coverage_url(@information_coverage), params: { information_coverage: { composition_product_id: @information_coverage.composition_product_id, compulsory_coverage: @information_coverage.compulsory_coverage, date_status: @information_coverage.date_status, description_franchise: @information_coverage.description_franchise, final_term: @information_coverage.final_term, maximum_reference: @information_coverage.maximum_reference, maximun_importance_value: @information_coverage.maximun_importance_value, minimum_premium_reference: @information_coverage.minimum_premium_reference, minimum_reference: @information_coverage.minimum_reference, munimum_importance_value: @information_coverage.munimum_importance_value, status: @information_coverage.status, type_coverage: @information_coverage.type_coverage, validity: @information_coverage.validity } }
    assert_redirected_to information_coverage_url(@information_coverage)
  end

  test "should destroy information_coverage" do
    assert_difference('InformationCoverage.count', -1) do
      delete information_coverage_url(@information_coverage)
    end

    assert_redirected_to information_coverages_url
  end
end
