require "test_helper"

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get result" do
    get quiz_result_url
    assert_response :success
  end
end
