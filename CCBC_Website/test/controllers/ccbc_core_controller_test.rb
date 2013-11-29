require 'test_helper'

class CcbcCoreControllerTest < ActionController::TestCase
  test "should get Home" do
    get :Home
    assert_response :success
  end

  test "should get About" do
    get :About
    assert_response :success
  end

  test "should get Join" do
    get :Join
    assert_response :success
  end

  test "should get Equip" do
    get :Equip
    assert_response :success
  end

  test "should get Programme" do
    get :Programme
    assert_response :success
  end

  test "should get Newsletters" do
    get :Newsletters
    assert_response :success
  end

  test "should get Club" do
    get :Club
    assert_response :success
  end

  test "should get Map" do
    get :Map
    assert_response :success
  end

  test "should get Booking" do
    get :Booking
    assert_response :success
  end

  test "should get Links" do
    get :Links
    assert_response :success
  end

end
