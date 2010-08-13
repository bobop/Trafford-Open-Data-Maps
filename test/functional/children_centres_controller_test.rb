require 'test_helper'

class ChildrenCentresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:children_centres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create children_centre" do
    assert_difference('ChildrenCentre.count') do
      post :create, :children_centre => { }
    end

    assert_redirected_to children_centre_path(assigns(:children_centre))
  end

  test "should show children_centre" do
    get :show, :id => children_centres(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => children_centres(:one).to_param
    assert_response :success
  end

  test "should update children_centre" do
    put :update, :id => children_centres(:one).to_param, :children_centre => { }
    assert_redirected_to children_centre_path(assigns(:children_centre))
  end

  test "should destroy children_centre" do
    assert_difference('ChildrenCentre.count', -1) do
      delete :destroy, :id => children_centres(:one).to_param
    end

    assert_redirected_to children_centres_path
  end
end
