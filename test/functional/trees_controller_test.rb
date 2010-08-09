require 'test_helper'

class TreesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tree" do
    assert_difference('Tree.count') do
      post :create, :tree => { }
    end

    assert_redirected_to tree_path(assigns(:tree))
  end

  test "should show tree" do
    get :show, :id => trees(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => trees(:one).to_param
    assert_response :success
  end

  test "should update tree" do
    put :update, :id => trees(:one).to_param, :tree => { }
    assert_redirected_to tree_path(assigns(:tree))
  end

  test "should destroy tree" do
    assert_difference('Tree.count', -1) do
      delete :destroy, :id => trees(:one).to_param
    end

    assert_redirected_to trees_path
  end
end
