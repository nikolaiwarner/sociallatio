require 'test_helper'

class InteractionTypesControllerTest < ActionController::TestCase
  setup do
    @interaction_type = interaction_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interaction_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create interaction_type" do
    assert_difference('InteractionType.count') do
      post :create, :interaction_type => @interaction_type.attributes
    end

    assert_redirected_to interaction_type_path(assigns(:interaction_type))
  end

  test "should show interaction_type" do
    get :show, :id => @interaction_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @interaction_type.to_param
    assert_response :success
  end

  test "should update interaction_type" do
    put :update, :id => @interaction_type.to_param, :interaction_type => @interaction_type.attributes
    assert_redirected_to interaction_type_path(assigns(:interaction_type))
  end

  test "should destroy interaction_type" do
    assert_difference('InteractionType.count', -1) do
      delete :destroy, :id => @interaction_type.to_param
    end

    assert_redirected_to interaction_types_path
  end
end
