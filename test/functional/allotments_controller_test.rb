require 'test_helper'

class AllotmentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allotments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allotment" do
    assert_difference('Allotment.count') do
      post :create, :allotment => { }
    end

    assert_redirected_to allotment_path(assigns(:allotment))
  end

  test "should show allotment" do
    get :show, :id => allotments(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => allotments(:one).to_param
    assert_response :success
  end

  test "should update allotment" do
    put :update, :id => allotments(:one).to_param, :allotment => { }
    assert_redirected_to allotment_path(assigns(:allotment))
  end

  test "should destroy allotment" do
    assert_difference('Allotment.count', -1) do
      delete :destroy, :id => allotments(:one).to_param
    end

    assert_redirected_to allotments_path
  end
end
