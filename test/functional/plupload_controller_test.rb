require 'test_helper'

class PluploadControllerTest < ActionController::TestCase
  test "should get upload_file" do
    get :upload_file
    assert_response :success
  end

end
