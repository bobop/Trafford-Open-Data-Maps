require 'test_helper'

class PollingStationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polling_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create polling_station" do
    assert_difference('PollingStation.count') do
      post :create, :polling_station => { }
    end

    assert_redirected_to polling_station_path(assigns(:polling_station))
  end

  test "should show polling_station" do
    get :show, :id => polling_stations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => polling_stations(:one).to_param
    assert_response :success
  end

  test "should update polling_station" do
    put :update, :id => polling_stations(:one).to_param, :polling_station => { }
    assert_redirected_to polling_station_path(assigns(:polling_station))
  end

  test "should destroy polling_station" do
    assert_difference('PollingStation.count', -1) do
      delete :destroy, :id => polling_stations(:one).to_param
    end

    assert_redirected_to polling_stations_path
  end
end
