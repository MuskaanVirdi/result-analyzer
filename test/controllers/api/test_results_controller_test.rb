require "test_helper"

class Api::TestResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_test_results_create_url
    assert_response :success
  end
end
