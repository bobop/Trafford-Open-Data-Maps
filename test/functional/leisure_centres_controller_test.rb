require 'test_helper'

class LeisureCentresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leisure_centres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leisure_centre" do
    assert_difference('LeisureCentre.count') do
      post :create, :leisure_centre => { }
    end

    assert_redirected_to leisure_centre_path(assigns(:leisure_centre))
  end

  test "should show leisure_centre" do
    get :show, :id => leisure_centres(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => leisure_centres(:one).to_param
    assert_response :success
  end

  test "should update leisure_centre" do
    put :update, :id => leisure_centres(:one).to_param, :leisure_centre => { }
    assert_redirected_to leisure_centre_path(assigns(:leisure_centre))
  end

  test "should destroy leisure_centre" do
    assert_difference('LeisureCentre.count', -1) do
      delete :destroy, :id => leisure_centres(:one).to_param
    end

    assert_redirected_to leisure_centres_path
  end
end
