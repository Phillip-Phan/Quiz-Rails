require "test_helper"

class QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get question_home_url
    assert_response :success
  end
end
