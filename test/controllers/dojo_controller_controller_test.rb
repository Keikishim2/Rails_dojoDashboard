require 'test_helper'

class DojoControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dojo_controller_index_url
    assert_response :success
  end

end
