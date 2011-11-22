require 'test_helper'

class TrainStationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:train_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create train_station" do
    assert_difference('TrainStation.count') do
      post :create, :train_station => { }
    end

    assert_redirected_to train_station_path(assigns(:train_station))
  end

  test "should show train_station" do
    get :show, :id => train_stations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => train_stations(:one).to_param
    assert_response :success
  end

  test "should update train_station" do
    put :update, :id => train_stations(:one).to_param, :train_station => { }
    assert_redirected_to train_station_path(assigns(:train_station))
  end

  test "should destroy train_station" do
    assert_difference('TrainStation.count', -1) do
      delete :destroy, :id => train_stations(:one).to_param
    end

    assert_redirected_to train_stations_path
  end
end
