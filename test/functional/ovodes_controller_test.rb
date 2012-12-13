require 'test_helper'

class OvodesControllerTest < ActionController::TestCase
  setup do
    @ovode = ovodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ovodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ovode" do
    assert_difference('Ovode.count') do
      post :create, ovode: @ovode.attributes
    end

    assert_redirected_to ovode_path(assigns(:ovode))
  end

  test "should show ovode" do
    get :show, id: @ovode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ovode
    assert_response :success
  end

  test "should update ovode" do
    put :update, id: @ovode, ovode: @ovode.attributes
    assert_redirected_to ovode_path(assigns(:ovode))
  end

  test "should destroy ovode" do
    assert_difference('Ovode.count', -1) do
      delete :destroy, id: @ovode
    end

    assert_redirected_to ovodes_path
  end
end
