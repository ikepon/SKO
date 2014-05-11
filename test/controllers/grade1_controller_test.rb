require 'test_helper'

class Grade1ControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get tangen" do
    get :tangen
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
