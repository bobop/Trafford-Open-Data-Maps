require 'test_helper'

class RecyclingSitesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recycling_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recycling_site" do
    assert_difference('RecyclingSite.count') do
      post :create, :recycling_site => { }
    end

    assert_redirected_to recycling_site_path(assigns(:recycling_site))
  end

  test "should show recycling_site" do
    get :show, :id => recycling_sites(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => recycling_sites(:one).to_param
    assert_response :success
  end

  test "should update recycling_site" do
    put :update, :id => recycling_sites(:one).to_param, :recycling_site => { }
    assert_redirected_to recycling_site_path(assigns(:recycling_site))
  end

  test "should destroy recycling_site" do
    assert_difference('RecyclingSite.count', -1) do
      delete :destroy, :id => recycling_sites(:one).to_param
    end

    assert_redirected_to recycling_sites_path
  end
end
