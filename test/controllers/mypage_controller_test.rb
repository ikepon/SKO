require 'test_helper'

class MypageControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get memo" do
    get :memo
    assert_response :success
  end

end
