require 'test_helper'

class TransitionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get transition_show_url
    assert_response :success
  end

end
