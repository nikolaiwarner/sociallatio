require 'test_helper'

class FrequenciesControllerTest < ActionController::TestCase
  setup do
    @frequency = frequencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequency" do
    assert_difference('Frequency.count') do
      post :create, :frequency => @frequency.attributes
    end

    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should show frequency" do
    get :show, :id => @frequency.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @frequency.to_param
    assert_response :success
  end

  test "should update frequency" do
    put :update, :id => @frequency.to_param, :frequency => @frequency.attributes
    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should destroy frequency" do
    assert_difference('Frequency.count', -1) do
      delete :destroy, :id => @frequency.to_param
    end

    assert_redirected_to frequencies_path
  end
end
