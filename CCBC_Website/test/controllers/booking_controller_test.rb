require 'test_helper'

class BookingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get book1" do
    get :book1
    assert_response :success
  end

  test "should get book2" do
    get :book2
    assert_response :success
  end

  test "should get book3" do
    get :book3
    assert_response :success
  end

end
