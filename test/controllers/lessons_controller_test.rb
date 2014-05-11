require 'test_helper'

class LessonsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new_lesson" do
    get :new_lesson
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end

  test "should get agreement" do
    get :agreement
    assert_response :success
  end

  test "should get privacy" do
    get :privacy
    assert_response :success
  end

end
